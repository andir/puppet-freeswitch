class freeswitch::install(String $package_name = 'freeswitch-meta-all') {

  include freeswitch::repo

  package { 'freeswitch-package':
    ensure    => latest,
    name      => $package_name,
    # so far only debian based distributions are supported, if this ever
    # changes, a pseudo resource that encapsulates the repository resources
    # would be the proper solution here
    require   => Apt::Source['freeswitch-repo'],
    subscribe => Apt::Source['freeswitch-repo'],
  }
}
