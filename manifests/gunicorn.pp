# == Class: puppetanalytics::gunicorn

class puppetanalytics::gunicorn(
  $port,
){
  include puppetanalytics::python
  file { '/etc/init.d/gunicorn-puppetanalytics': ensure  => present,
    content => template('puppetanalytics/gunicorn-puppetanalytics-init.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  } ->
  service { 'gunicorn-puppetanalytics':
    ensure => running,
    enable => true,
    notify => Class['nginx::service'],
  }

}
