class profile_firewall (
    $purge_rules  = false,
    $purge_chains = false,
) {
    $firewalls = hiera_hash('profile_firewall::firewall_rules', {})
    $firewallchains = hiera_hash('profile_firewall::firewall_chains', {})

    $firewall_defaults = {}
    $firewallchain_defaults = {}

    create_resources(firewall, $firewalls, $firewall_defaults)
    create_resources(firewallchain, $firewallchains, $firewallchain_defaults)

    Firewall {
        before  => Class['profile_firewall::post'],
        require => Class['profile_firewall::pre'],
    }

    class { ['profile_firewall::pre', 'profile_firewall::post']: }
    class { 'firewall': }

    if $purge_rules {
        resources { 'firewall':
            purge => true,
        }
    }

    if $purge_chains {
        resources { 'firewallchain':
            purge => true,
        }
    }
}
