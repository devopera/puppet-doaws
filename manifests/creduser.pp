define doaws::creduser (

  # class arguments
  # ---------------
  # setup defaults

  $user = $title,
  $notifier_dir = '/etc/puppet/tmp',
  $account_id = 'n/a',
  $console_username = 'n/a',
  $console_password = 'n/a',
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

  file { "doaws-dir-${user}" :
    path   => "${filepath}",
    ensure => 'directory'
  }

  file { "doaws-creds-${user}" :
    path    => "${filepath}credentials",
    ensure  => 'file',
    content => template('doaws/credentials.erb'),
  }

}

