class doaws (

  # class arguments
  # ---------------
  # setup defaults

  $user = 'web',
  $notifier_dir = '/etc/puppet/tmp',
  $secret_access_key,
  $access_key_id,
  $region,

  # end of class arguments
  # ----------------------
  # begin class

) {

  case $operatingsystem {
    centos, redhat, fedora,
    ubuntu, debian: {
      $filepath = "/home/${user}/.aws/"
    }
    windows: {
      $filepath = "C:\\Users\\${user}\\.aws\\"
    }
  }

  file { 'doaws-dir' :
    path   => "${filepath}",
    ensure => 'directory'
  }

  file { 'doaws-creds' :
    path    => "${filepath}credentials",
    ensure  => 'file',
    content => template('doaws/credentials.erb'),
  }

}

