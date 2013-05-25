define incron::task ($ensure = 'present', $path, $mask, $command) {
  #  $path_r = $path ? {
  #    undef   => $name,
  #    default => $path,
  #  }

  file { "/etc/incron.d/${name}":
    content => "${path} ${mask} ${command}\n",
    ensure  => $ensure,
    require => Package['incron'],
  }
}