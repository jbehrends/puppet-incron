class incron::base {
  package{'incron':
    ensure => installed,
  }
  service{'incrond':
    ensure => running,
    enable => true,
    require => Package['incron'],
  }
}
