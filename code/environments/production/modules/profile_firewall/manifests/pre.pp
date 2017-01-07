class profile_firewall::pre {
    Firewall {
        require => undef,
    }

    firewallchain {
        'INPUT:filter:IPv4':
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

    # Default firewall rules
    firewall { '000 accept all icmp':
        proto  => 'icmp',
        action => 'accept',
    }->
    firewall { '001 accept all to lo interface':
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
    }->
    firewall { '002 reject local traffic not on loopback interface':
        iniface     => '! lo',
        proto       => 'all',
        destination => '127.0.0.1/8',
        action      => 'reject',
    }->
    firewall { '003 accept related established rules':
        proto  => 'all',
        state  => ['RELATED', 'ESTABLISHED'],
        action => 'accept',
    }
}
