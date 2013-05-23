class User < ActiveLdap::Base
  ldap_mapping dn_attribute: "cn",
               prefix: "ou=Domain Users"
               #classes: ["person", "PosixAccount"]

  def self.allusers
  	arr = Array.new
	us = User.find(:all, "*")
	us.each do |u|
		arr << {"fio" => u.cn,"department" => (u.department rescue "") }
	end
	arr
  end

            	
          
end
