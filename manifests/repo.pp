class freeswitch::repo {

  if($::osfamily != 'Debian') {
    fail('only debian osfamily supported for now')
  }

  if($::lsbdistcodename != 'jessie') {
    fail('only debian jessie is supported')
  }

  include apt

  apt::source { 'freeswitch-repo':
    comment  => 'FreeSWITCH Package Repository',
    location => 'https://files.freeswitch.org/repo/deb/freeswitch-1.6',
    key      => {
      server => 'hpks.pooks.sks-keyservers.net',
      id     =>'20B06EE621AB150D40F6079FD76EDC7725E010CF',
    },
    repos    => $::lsbdistcodename,
  }

}
