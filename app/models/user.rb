class User < ActiveLdap::Base
  ldap_mapping dn_attribute: "cn",
               prefix: "ou=Domain Users"
               #classes: ["person", "PosixAccount"]

  def self.allusers
  	arr = Array.new
	us = User.find(:all, "*")
	us.each do |u|
		arr << {"fio" => u.cn,
			"department" => (u.department rescue ""),
			"phonenumber" => (u.telephoneNumber rescue ""),
			"email" => (u.mail rescue ""),
			"title" => (u.title rescue "") } if (u.department.present? rescue false) and u.userAccountControl!=514 and u.userAccountControl!=66050
	end
	arr
  end

            	
          
end
