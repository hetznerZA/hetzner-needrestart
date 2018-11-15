require 'spec_helper'
default_content = <<~CONTENT
  # managed with puppet (module needrestart)

  $nrconf{default_value} = {
  };
  CONTENT

describe 'needrestart' do
  context 'with default values for all parameters on Debian' do
    let(:facts) { { operatingsystem: 'Debian' } }

    it { is_expected.to contain_class('needrestart') }
    it { is_expected.to contain_package('needrestart') }
    it { is_expected.to contain_file('/etc/needrestart/conf.d/').with(
      'ensure' => 'directory') }
    it { is_expected.to contain_file('/etc/needrestart/conf.d/overrides.conf').with(
      'content' => default_content) }
  end

  context 'with default values for all parameters on Ubuntu 16.04' do
    let(:facts) { { operatingsystem: 'Ubuntu', lsbdistrelease: '16.04' } }

    it { is_expected.to contain_class('needrestart') }
    it { is_expected.to contain_package('needrestart') }
    it { is_expected.to contain_file('/etc/needrestart/conf.d/').with(
      'ensure' => 'directory') }
    it { is_expected.to contain_file('/etc/needrestart/conf.d/overrides.conf').with(
      'content' => default_content) }
  end
end
