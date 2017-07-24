class profile_firewall::post {
    firewall { '999 drop all (IPv4)':
        proto  => 'all',
        action => 'drop',
        before => undef,
    }

    firewall { '999 drop all (IPv6)':
        proto    => 'all',
        action   => 'drop',
        provider => 'ip6tables',
        before   => undef,
    }
}
