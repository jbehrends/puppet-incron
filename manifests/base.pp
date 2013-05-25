class incron::base {
  package { 'incron': ensure => installed, }

  service { 'incron':
    ensure  => running,
    enable  => true,
    require => Package['incron'],
  }
}
