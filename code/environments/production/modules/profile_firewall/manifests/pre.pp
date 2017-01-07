class profile_firewall::pre {
    Firewall {
        require => undef,
    }

    firewallchain {
        ['INPUT:filter:IPv4', 'INPUT:filter:IPv6']:
            ensure => 'present',
            purge  => true,
            policy => 'accept',
            before => undef,
            ignore => [
                '-j fail2ban-[^\s]+', # ignore the fail2ban jump rules
                '-j f2b-[^\s]+', # ignore the fail2ban jump rules
                # ignore any rules with "ignore" (case insensitive) in the comment in the rule
                '--comment "[^"](?i:ignore)[^"]"',
            ];
    }

    # Default firewall rules (IPv4)
    firewall { '000 accept all icmp (IPv4)':
        proto  => 'icmp',
        action => 'accept',
    }->
    firewall { '001 accept all to lo interface (IPv4)':
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
    }->
    firewall { '002 reject local traffic not on loopback interface (IPv4)':
        iniface     => '! lo',
        proto       => 'all',
        destination => '127.0.0.1/8',
        action      => 'reject',
    }->
    firewall { '003 accept related established rules (IPv4)':
        proto  => 'all',
        state  => ['RELATED', 'ESTABLISHED'],
        action => 'accept',
    }

    # Default firewall rules (IPv6)
    firewall { '000 accept all icmp (IPv6)':
        proto    => 'icmp',
        action   => 'accept',
        provider => 'ip6tables',
    }->
    firewall { '001 accept all to lo interface (IPv6)':
        proto    => 'all',
        iniface  => 'lo',
        action   => 'accept',
        provider => 'ip6tables',
    }->
    firewall { '002 reject local traffic not on loopback interface (IPv6)':
        iniface     => '! lo',
        proto       => 'all',
        destination => '::1/128',
        action      => 'reject',
        provider    => 'ip6tables',
    }->
    firewall { '003 accept related established rules (IPv6)':
        proto    => 'all',
        state    => ['RELATED', 'ESTABLISHED'],
        action   => 'accept',
        provider => 'ip6tables',
    }
}
