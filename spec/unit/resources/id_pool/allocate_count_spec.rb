require_relative './../../../spec_helper'

klass = OneviewSDK::IDPool
describe 'oneview_test::id_pool_allocate_count' do
  let(:resource_name) { 'id_pool' }
  include_context 'chef context'
  include_context 'shared context'

  it 'allocates a certain quantity of IDs' do
    expect_any_instance_of(klass).to receive(:allocate_count).with('vmac', 2)
    expect(real_chef_run).to allocate_count_oneview_id_pool('IDPool4')
  end
end
