class doaws (

  # class arguments
  # ---------------
  # setup defaults

  $user = undef,
  $users = hiera('doaws::users', {}),
  $user_defaults = hiera('dows::user_defaults', {}),
  $notifier_dir = '/etc/puppet/tmp',
  $secret_access_key = undef,
  $access_key_id = undef,
  $region = undef,

  # end of class arguments
  # ----------------------
  # begin class

) {

  if ($user != undef) {
    doaws::creduser { 'doaws-creduser-default-user' :
      user => $user,
      secret_access_key => $secret_access_key,
      access_key_id => $access_key_id,
      region => $region,
    }
  }

  # create multiple users if details passed in hash
  if ($users != {}) {
    create_resources(doaws::creduser, $users, $user_defaults)
  }

}

