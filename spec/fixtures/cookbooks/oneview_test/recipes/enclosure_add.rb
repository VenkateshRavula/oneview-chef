#
# Cookbook Name:: oneview_test
# Recipe:: enclosure_add
#
# (c) Copyright 2016 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#

oneview_enclosure 'Enclosure1' do
  client node['oneview_test']['client']
  data(
    hostname: @enclosure_hostname,
    username: 'Admin',
    password: 'Secret123',
    enclosureGroupUri: '/rest/fake',
    licensingIntent: 'OneView'
  )
end
