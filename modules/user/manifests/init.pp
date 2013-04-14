class user {
	user { "hangover":
		ensure => present,
		uid => '501',
		gid => 'manish',
		#gid => '501',
		shell => '/bin/bash',
		home =>	'/home/hangover',
		managehome => true,
		password => 'hangover',
		groups => ['manish'],
		comment => 'Hangover the Cool Guy',
		password_min_age => '0',
		password_max_age => '99999',
	}
}
