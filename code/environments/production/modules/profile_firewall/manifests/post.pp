class profile_firewall::post {
    profile_firewall::rule { '999 drop all':
        parameters => {
            proto  => 'all',
            action => 'drop',
            before => undef,
        }
    }
}
