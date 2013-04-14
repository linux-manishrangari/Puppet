class impfile { 
	file { "/etc/passwd":
		ensure => present,
		owner => "root",
		group => "root",
		source => "puppet://$puppetserver/modules/impfile/passwd",
		mode => 0644,
		backup => ".bak",
	}
	file { "/etc/group":
                ensure => present,
                owner => "root",
                group => "root",
		source => "puppet://$puppetserver/modules/impfile/group",
                mode => 0644,
		backup => ".bak",
        }
	file { "/etc/shadow":
                ensure => present,
                owner => "root",
                group => "root",
		source => "puppet://$puppetserver/modules/impfile/shadow",
                mode => 0000,
		backup => ".bak",
        }
	file { "/root/testfile":
		ensure => present,
		owner => "manish",
		group => "manish",
		mode => 0100,
		content => "This is a test file for testing puppet.",
		path => "/root/testfile",
	}
	file { "/root/test":
		ensure => link,
		target => '/root/testfile',
	}
	file { "/root/ppp":
		ensure => directory,
		mode => 0700,
		owner => "manish",
		group => "manish",
		#require => Package['httpd'],
		#notify => Service['httpd'],
	}
	file { "/tmp/tree":
                source => "puppet:///modules/impfile/tree",
                recurse => true,
		purge => true, # Sometimes, you want to deploy files to an existing directory, but remove any files that aren't managed by Puppet.
        }
}
notify {"I'm notifying you.":} # Whitespace is fungible, remember.
notify {"So am I!":}

#filebucket { main:
#    	server => puppet,
#    	path   => false,
#    	# The path => false line works around a known issue with the filebucket type.
#}

#file { "/my/file":
#    	source => "/path/in/nfs/or/something",
#    	backup => main
#}

#file { [ "/etc/nagios3/generic-service_nagios2.cfg",
#	"/etc/nagios3/services_nagios2.cfg",
#	"/etc/nagios3/hostgroups_nagios2.cfg",
#	"/etc/nagios3/extinfo_nagios2.cfg",
#	"/etc/nagios3/localhost_nagios2.cfg",
#	"/etc/nagios3/contacts_nagios2.cfg",
#	"/etc/nagios3/conf.d"
#	]:
#	ensure => absent,
#	force => true,
	# Perform the file operation even if it will destroy one or more directories. You must use force in order to:

  #  purge subdirectories
   # Replace directories with files or links
    #Remove a directory when ensure => absent Valid values are true, false.

#}

#file { "/root/iptables/hosts/${hostname}":
#	content => "export MAIN_IP=${ipaddress}\n",
#	replace => false,
#	require => File["/root/iptables/hosts"],
#	notify => Exec["run-iptables"],
#}
