class dashy {

  file { 'checkin' :
    ensure  => present,
    path    => '/usr/local/bin/checkin.sh',
    source  => 'puppet:///modules/dashy/checkin.sh',
    owner   => root,
    group   => root,
    mode    => '0755',
  }
  
  cron { 'get_checkin' :
    ensure  => 'present',
    command => '(/bin/sh -c /usr/local/bin/checkin.sh) > /dev/null 2>&1',
    user    => root,
    minute  => '*/15',
  }  
}
