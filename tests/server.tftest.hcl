mock_provider "hcloud" {}

variables {
  name        = "test-server"
  server_type = "cx22"
  location    = "nbg1"
  image       = "debian-12"
}

run "names_the_server_exactly_what_the_caller_passes" {
  command = plan

  assert {
    condition     = hcloud_server.this.name == "test-server"
    error_message = "The module must not decorate var.name. No random suffix, no index"
  }
}

run "leaves_protection_off_by_default" {
  command = plan

  assert {
    condition     = hcloud_server.this.delete_protection == false && hcloud_server.this.rebuild_protection == false
    error_message = "var.protection defaults to false"
  }
}

run "one_protection_variable_drives_both_attributes" {
  command = plan

  variables {
    protection = true
  }

  assert {
    condition     = hcloud_server.this.delete_protection == hcloud_server.this.rebuild_protection
    error_message = "Hetzner requires delete_protection and rebuild_protection to agree"
  }

  assert {
    condition     = hcloud_server.this.delete_protection == true
    error_message = "protection = true must reach both attributes"
  }
}

run "creates_no_placement_group_by_default" {
  command = plan

  assert {
    condition     = length(hcloud_placement_group.this) == 0
    error_message = "placement_group_create defaults to false"
  }

  assert {
    condition     = hcloud_server.this.placement_group_id == null
    error_message = "With no placement group the server attribute stays null"
  }
}

run "creates_the_placement_group_when_asked" {
  command = plan

  variables {
    placement_group_create = true
    placement_group_name   = "test-spread"
  }

  assert {
    condition     = length(hcloud_placement_group.this) == 1
    error_message = "placement_group_create = true creates exactly one group"
  }

  assert {
    condition     = hcloud_placement_group.this[0].type == "spread"
    error_message = "The module only ever creates a spread group"
  }
}

run "enables_the_public_ipv4_when_asked" {
  command = plan

  variables {
    public_ipv4_enabled = true
  }

  assert {
    condition     = one(hcloud_server.this.public_net).ipv4_enabled == true
    error_message = "public_ipv4_enabled must reach public_net"
  }

}

# public_net.ipv4 is computed when unset, so it is unknown until apply.
run "attaches_an_existing_primary_ipv4_when_given_one" {
  command = apply

  variables {
    public_ipv4_enabled = true
    primary_ipv4_id     = 4242
  }

  assert {
    condition     = one(hcloud_server.this.public_net).ipv4 == 4242
    error_message = "primary_ipv4_id must reach public_net.ipv4"
  }
}

run "attaches_no_private_network_by_default" {
  command = plan

  assert {
    condition     = length(hcloud_server.this.network) == 0
    error_message = "A null network_id attaches no private network"
  }
}
