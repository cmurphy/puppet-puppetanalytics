# == Class: puppetanalytics::python

class puppetanalytics::python {
  
  class { '::python':
    version    => '2.7',
    virtualenv => true,
  }

  python::requirements { '/opt/puppet-analytics/requirements.txt':
    virtualenv => '/opt/python/flaskenv',
    owner      => 'www-data',
    group      => 'www-data',
  }

  python::virtualenv { '/opt/python/flaskenv':
    ensure       => present,
    version      => '2.7',
    requirements => '/opt/puppet-analytics/requirements.txt',
    owner        => 'www-data',
    group        => 'www-data',
  }  

  python::pip { 'gunicorn':
    virtualenv => '/opt/python/flaskenv',
    owner      => 'www-data',
  }

}
