# Class for bootstrapping auth stuff
class bootstrap::auth (
) {
  $users = lookup('bootstrap::auth::users', {merge => hash})
  $ssh_authorized_keys = lookup('bootstrap::auth::ssh_authorized_keys', {merge => hash})
  $groups = lookup('bootstrap::auth::groups', {merge => hash})

  $user_defaults = {
    ensure         => 'present',
    managehome     => true,
    shell          => '/bin/bash',
    purge_ssh_keys => true,
  }

  $ssh_authorized_key_defaults = {
    ensure => 'present',
  }

  $group_defaults = {
    ensure => 'present',
  }

  create_resources(user, $users, $user_defaults)
  create_resources(ssh_authorized_key, $ssh_authorized_keys, $ssh_authorized_key_defaults)
  create_resources(group, $groups, $group_defaults)
}
