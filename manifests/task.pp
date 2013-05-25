define incron::task ($ensure = 'present', $path, $mask, $command) {
  #  $path_r = $path ? {
  #    undef   => $name,
  #    default => $path,
  #  }
  $masks = [
    'IN_ACCESS',
    'IN_MODIFY',
    'IN_ATTRIB',
    'IN_CLOSE_WRITE',
    'IN_CLOSE_NOWRITE',
    'IN_OPEN',
    'IN_MOVED_FROM',
    'IN_MOVED_TO',
    'IN_CREATE',
    'IN_DELETE',
    'IN_DELETE_SELF',
    'IN_UNMOUNT',
    'IN_Q_OVERFLOW',
    'IN_IGNORED',
    'IN_CLOSE',
    'IN_MOVE',
    'IN_ISDIR',
    'IN_ONESHOT',
    'IN_ALL_EVENTS']

  if !($mask in $masks) {
    err("${mask} not known. see: https://www.kernel.org/pub/linux/kernel/people/rml/inotify/headers/inotify.h for allowed values")
  }

  file { "/etc/incron.d/${name}":
    content => "${path} ${mask} ${command}\n",
    ensure  => $ensure,
    require => Package['incron'],
  }
}