class profile_firewall (
    $purge_rules  = false,
    $purge_chains = false,
) {
    $firewalls = lookup('profile_firewall::firewall_rules', {merge => hash})
    $firewallchains = lookup('profile_firewall::firewall_chains', {merge => hash})

    $firewall_defaults = {}
    $firewallchain_defaults = {}

    create_resources(profile_firewall::rule, $firewalls, $firewall_defaults)
    create_resources(firewallchain, $firewallchains, $firewallchain_defaults)

    Firewall {
        before  => Class['profile_firewall::post'],
        require => Class['profile_firewall::pre'],
    }

    Profile_firewall::Rule {
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
