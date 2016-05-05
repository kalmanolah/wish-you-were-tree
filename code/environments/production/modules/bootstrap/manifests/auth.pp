# Class for bootstrapping auth stuff
class bootstrap::auth (
) {
  $users = hiera_hash('bootstrap::auth::users', {})
  $ssh_authorized_keys = hiera_hash('bootstrap::auth::ssh_authorized_keys', {})
  $groups = hiera_hash('bootstrap::auth::groups', {})

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
