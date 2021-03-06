require_relative './../../../spec_helper'

describe 'oneview_test_api300_synergy::logical_switch_group_replace_scopes' do
  let(:resource_name) { 'logical_switch_group' }
  include_context 'chef context'

  let(:target_class) { OneviewSDK::API300::C7000::LogicalSwitchGroup }
  let(:scope_class) { OneviewSDK::API300::C7000::Scope }
  let(:target_match_method) { [:replace_oneview_logical_switch_group_scopes, 'LogicalSwitchGroup1'] }
  it_behaves_like 'action :replace_scopes'
end
