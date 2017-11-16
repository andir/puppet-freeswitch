require 'spec_helper'

describe 'freeswitch::install', :type => :class do
  let(:facts) do {
        os: { family:  'Debian', name: 'Debian', release: { major: '9', full: '9.1'} },
        osfamily: 'Debian',
        lsbdistid: 'Debian',
        lsbdistcodename: 'stretch',
    }
    end

    context "with the default package name" do
      it { should compile }
    end

    context "with a custom package name" do
      package_name = "my-dummy-package-name"
      let(:params) do {
        package_name: package_name,
      } end

      it {
              should compile
              is_expected.to contain_package('freeswitch-package').with(name: package_name)
      }
    end
end
