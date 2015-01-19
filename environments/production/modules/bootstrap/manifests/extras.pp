class bootstrap::extras (
  $files    = {},
  $augeas   = {},
  $vcsrepos = {},
  $packages = {},
  $mounts   = {},
  $execs    = {},
) {
  $file_defaults = {
    ensure => 'present',
  }

  $augeas_defaults = {}

  $vcsrepo_defaults = {
    ensure   => 'present',
    provider => 'git',
  }

  $package_defaults = {
    ensure => 'present',
  }

  $mount_defaults = {
    ensure => 'present',
  }

  $exec_defaults = {
    path => '/usr/bin:/usr/local/bin:/bin:/usr/local/sbin',
  }

  create_resources(file, $files, $file_defaults)
  create_resources(augeas, $augeas, $augeas_defaults)
  create_resources(vcsrepo, $vcsrepos, $vcsrepo_defaults)
  create_resources(package, $packages, $package_defaults)
  create_resources(mount, $mounts, $mount_defaults)
  create_resources(exec, $execs, $exec_defaults)
}
