# (C) Copyright 2017 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

# NOTE:
# This shared example requires the following variables:
#  target_class - Full name of the OneView resource to be tested
#  target_match_method - Array with name of match method called and with the argument of the match method,
#    e.g: let(:target_match_method) { [:add_oneview_enclosure_to_scopes, 'EnclosureName'] }

RSpec.shared_examples 'action :refresh #set_refresh_state' do
  it 'refresh already triggered' do
    expect_any_instance_of(target_class).to receive(:retrieve!).and_return(true)
    allow_any_instance_of(target_class).to receive(:[]).with('refreshState').and_return('RefreshPending')
    allow_any_instance_of(target_class).to receive(:[]).with('name').and_return(*target_match_method)
    expect_any_instance_of(target_class).to_not receive(:set_refresh_state)
    expect(real_chef_run).to send(*target_match_method)
  end

  it 'refresh with default options' do
    expect_any_instance_of(target_class).to receive(:retrieve!).and_return(true)
    allow_any_instance_of(target_class).to receive(:[]).with('refreshState').and_return('NotRefreshing')
    allow_any_instance_of(target_class).to receive(:[]).with('name').and_return(*target_match_method)
    expect_any_instance_of(target_class).to receive(:set_refresh_state).and_return(true)
    expect(real_chef_run).to send(*target_match_method)
  end

  it 'raises an error when it does not exist' do
    allow_any_instance_of(target_class).to receive(:retrieve!).and_return(false)
    expect_any_instance_of(target_class).to_not receive(:set_refresh_state)
    expect { real_chef_run }.to raise_error(StandardError, /not found/)
  end
end
