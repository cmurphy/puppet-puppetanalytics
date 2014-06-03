# == Class: puppetanalytics::nginx

class puppetanalytics::nginx(
  $port,
){
  include ::nginx

  nginx::resource::vhost { 'puppet-analytics.org':
    proxy => "http://127.0.0.1:${port}",
  }

  nginx::resource::upstream { 'puppet-analytics':
    ensure  => present,
    members => ["localhost:${port}"],
  }
}
