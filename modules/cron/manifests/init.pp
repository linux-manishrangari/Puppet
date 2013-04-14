class cron {
	cron { test:
		command => "/root/test.sh",
		user => root,
		minute => 1, # must be between 0 and 59, inclusive
		ensure => present,
		environment => "PATH=/usr/lib/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
	}
}
		#hour => 1, # must be between 0 and 23
		#month => 1, # must be between 1 and 12 or the month name (e.g., December).
		#monthday => 1, # must be between 1 and 31.
		#weekday => 1, # must be between 0 and 7, inclusive, with 0 (or 7) being Sunday, or must be the name of the day (e.g., Tuesday).
