class freeswitch::repo {

  if($::osfamily != 'Debian') {
    fail('only debian osfamily supported for now')
  }

  include apt

  apt::key {'freeswitch-key':
    id => '20B06EE621AB150D40F6079FD76EDC7725E010CF'
  }
  apt::source { 'freeswitch-repo':
    comment  => 'FreeSWITCH Package Repository',
    location => 'https://files.freeswitch.org/repo/deb/freeswitch-1.6',
    repos    => $::lsbdistcodename,
    require  => Apt::Key['freeswitch-key'],
  }

}
