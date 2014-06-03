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
    revision => '35975ec8ae414db575003f99a2609002b31549cc',
  }

}
