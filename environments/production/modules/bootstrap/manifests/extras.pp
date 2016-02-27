# Class for bootstrapping extra stuff
class bootstrap::extras (
  $files            = {},
  $file_lines       = {},
  $augeas           = {},
  $vcsrepos         = {},
  $packages         = {},
  $mounts           = {},
  $execs            = {},
  $archives         = {},
  $concats          = {},
  $concat_fragments = {},
) {
  $file_defaults = {
    ensure => 'present',
  }

  $file_line_defaults = {
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

  $archive_defaults = {
    ensure => 'present',
  }

  $concat_defaults = {}
  $concat_fragment_defaults = {}

  create_resources(file, $files, $file_defaults)
  create_resources(file_line, $file_lines, $file_line_defaults)
  create_resources(augeas, $augeas, $augeas_defaults)
  create_resources(vcsrepo, $vcsrepos, $vcsrepo_defaults)
  create_resources(package, $packages, $package_defaults)
  create_resources(mount, $mounts, $mount_defaults)
  create_resources(exec, $execs, $exec_defaults)
  create_resources(archive, $archives, $archive_defaults)
  create_resources(concat, $concats, $concat_defaults)
  create_resources(concat::fragment, $concat_fragments, $concat_fragment_defaults)
}
