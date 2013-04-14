class packages {
	package { "nmap":
		#ensure => installed|present|latest
		ensure => installed,
		#require => File["/etc/ntp.conf"],
		#require => Package["rubygems"],
	}
	package { [ "rdesktop", "mussh" ]: ensure => installed }
}

#exec { "download-virtualbox":
#	cwd => "/root",
#	command => "/usr/bin/wget http://download.virtualbox.org/virtualbox/4.1.0/virtualbox-4.1_4.1.0-73009~Ubuntu~lucid_i386.deb",
#	creates => "/root/virtualbox-4.1_4.1.0-73009~Ubuntu~lucid_i386.deb",
#	timeout => "-1",
	#logoutput => true,
#}
#package { "rack":
#	provider => gem,
#	ensure => installed,
#}
