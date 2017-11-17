class freeswitch::repo {

  if($::osfamily != 'Debian') {
    fail('only debian osfamily supported for now')
  }

  include apt

  apt::source { 'freeswitch-repo':
    comment  => 'FreeSWITCH Package Repository',
    location => 'https://files.freeswitch.org/repo/deb/freeswitch-1.8',
    key      => {
      server => 'hpks.pooks.sks-keyservers.net',
      id     =>'5E098B3D18406E8E19543709BD3189F5A2B57698',
    },
    repos    => $::lsbdistcodename,
  }

}
