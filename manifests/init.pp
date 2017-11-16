class freeswitch(
  String $config_git_repo
) {
  include freeswitch::install

  vcsrepo {'freeswitch-config-repo':
    ensure   => present,
    provider => git,
    name     => '/etc/freeswitch/',
    source   => $config_git_repo,
    notify   => Exec['freeswitch-reload'],
  }

  service {'freeswitch-service':
    ensure  => running,
    name    => 'freeswitch',
    enable  => true,
    require => [
      Vcsrepo['freeswitch-config-repo'],
      Package['freeswitch-package'],
    ],
  }

  exec { 'freeswitch-reload':
    refreshonly => true,
    name        => '/usr/bin/fs_cli reload_xml',
    require     => [
      Service['freeswitch-service'],
      Package['freeswitch-package'],
    ],
  }
}
