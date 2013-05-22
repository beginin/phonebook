class User < ActiveLdap::Base
  ldap_mapping dn_attribute: "cn",
               prefix: "ou=Domain Users"
               #classes: ["person", "PosixAccount"]
end
