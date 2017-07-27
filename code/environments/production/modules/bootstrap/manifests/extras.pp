# Class for bootstrapping extra stuff
class bootstrap::extras (
) {
  $files = lookup('bootstrap::extras::files', {merge => hash})
  $file_lines = lookup('bootstrap::extras::file_lines', {merge => hash})
  $augeas = lookup('bootstrap::extras::augeas', {merge => hash})
  $vcsrepos = lookup('bootstrap::extras::vcsrepos', {merge => hash})
  $packages = lookup('bootstrap::extras::packages', {merge => hash})
  $mounts = lookup('bootstrap::extras::mounts', {merge => hash})
  $execs = lookup('bootstrap::extras::execs', {merge => hash})
  $archives = lookup('bootstrap::extras::archives', {merge => hash})
  $concats = lookup('bootstrap::extras::concats', {merge => hash})
  $concat_fragments = lookup('bootstrap::extras::concat_fragments', {merge => hash})
  $cronjobs = lookup('bootstrap::extras::cronjobs', {merge => hash})
  $services = lookup('bootstrap::extras::services', {merge => hash})

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
  $cronjob_defaults = {}
  $service_defaults = {}

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
  create_resources(cron, $cronjobs, $cronjob_defaults)
  create_resources(service, $services, $service_defaults)
}
