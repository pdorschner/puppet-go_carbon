require 'spec_helper'

describe 'go_carbon' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('go_carbon') }
  end
end
