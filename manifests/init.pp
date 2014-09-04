# == Class: puppetanalytics

class puppetanalytics {
  class { 'puppetanalytics::gunicorn':
    port => 8000,
  }
  class { 'puppetanalytics::nginx':
    port => 8000,
  }

  package { 'sqlite3':
    ensure => installed,
  }

  vcsrepo { '/opt/puppet-analytics':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/nibalizer/puppet-analytics.git',
    revision => 'master',
    notify   => Service['gunicorn-puppetanalytics'],
  }

}
