require 'spec_helper'

describe 'freeswitch::repo', :type => :class do
  let(:params) do end
  context "on a Debian based OS" do
    let(:facts) do {
        os: { family:  'Debian', name: 'Debian', release: { major: '9', full: '9.1'} },
        osfamily: 'Debian',
        lsbdistid: 'Debian',
        lsbdistcodename: 'stretch',
#        puppetversion: Puppet.version
    }
    end
    it { should compile }
    it { is_expected.to contain_apt__source('freeswitch-repo').with(ensure: 'present') }
  end
end
