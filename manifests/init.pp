class coding {

        exec { 'apt-get update':
		command => '/usr/bin/apt-get update',
		refreshonly => 'true',
                }

        package { apache2:
                require => Exec['apt-get update'],
                ensure => 'installed',
                allowcdrom => 'true',
                }
	
	service { 'apache2':
		ensure => 'true',
		enable => true,
		require => Package['apache2'],
		}

	file { '/home/xubuntu/public_html':
		ensure => 'directory',
		owner => 'xubuntu',
		mode => '0644',
		}

	file { '/home/xubuntu/public_html/index.html':
		content => template('coding/index.html.erb'),
		require => File['/home/xubuntu/public_html'],
		owner => 'xubuntu',
		mode => '0644',
		}

	file { '/etc/apache2/mods-enabled/userdir.load':
		ensure => 'link',
		target => '/etc/apache2/mods-available/userdir.load',
		notify => Service["apache2"],
		require => Package["apache2"],
		}
		
        package { openjdk-8-jre:
                require => Exec['apt-get update'],
                ensure => 'installed',
                allowcdrom => 'true',
                }

        package { eclipse:
                require => Exec['apt-get update'],
                ensure => 'installed',
                allowcdrom => 'true',
                }

	file { '/etc/skel/Main.java':
		ensure => 'file',
		content => template('coding/Main.java.erb'),
		owner => 'root',
		group => 'root',
		mode => '0644',
		}

	file { '/etc/skel/index.html':
                ensure => 'file',
                content => template('coding/index.html.erb'),
                owner => 'root',
                group => 'root',
                mode => '0644',
                }
		
	file { '/home/xubuntu/Main.java':
		ensure => 'file',
		content => template('coding/Main.java.erb'),
		owner => 'root',
		group => 'root',
		mode => '0644',
		}

        exec { 'OpenEclipse':
                command => '/usr/bin/eclipse &',
                require => Package['eclipse'],
                }
}	


