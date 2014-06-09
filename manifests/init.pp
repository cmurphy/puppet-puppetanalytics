# == Class: puppetanalytics

class puppetanalytics {
  class { 'puppetanalytics::gunicorn':
    port => 8000,
  }
  class { 'puppetanalytics::nginx':
    port => 8000,
  }

  vcsrepo { '/opt/puppet-analytics':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/nibalizer/puppet-analytics.git',
    revision => '643f4fe4fd23aea33e8a0563607bed425be0f736',
  }

}
