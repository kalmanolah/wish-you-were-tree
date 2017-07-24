# Defined type for a IPv4 + IPv6 firewall rule
define profile_firewall::rule (
  $parameters = {},
  $ipv4       = true,
  $ipv6       = true,
) {
  if $ipv4 {
    create_resources(firewall, {
      "${name} (IPv4)" => $parameters,
    })
  }

  if $ipv6 {
    $parameters_ipv6 = merge($parameters, {
      'provider' => 'ip6tables',
    })

    create_resources(firewall, {
      "${name} (IPv6)" => $parameters_ipv6,
    })
  }
}
