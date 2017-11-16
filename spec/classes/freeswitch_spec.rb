require 'spec_helper'

describe 'freeswitch', :type => :class do

let(:facts) do {
        os: { family:  'Debian', name: 'Debian', release: { major: '9', full: '9.1'} },
        osfamily: 'Debian',
        lsbdistid: 'Debian',
        lsbdistcodename: 'stretch',
}
end
  context "require config_git_repo param" do
    it { is_expected.to compile.and_raise_error(/parameter 'config_git_repo'/) }
  end

  context "compile just fine with config_git_repo set" do
    let(:params) do { config_git_repo: "git://127.0.0.1/nope.git" } end
    it {
        should compile
        is_expected.to contain_vcsrepo('freeswitch-config-repo')
        is_expected.to contain_service('freeswitch-service')
        is_expected.to contain_exec('freeswitch-reload')
    }
  end


end
