#
# Cookbook Name:: was
# Recipe:: add-service
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

user = Chef::EncryptedDataBagItem.load('users', 'wasadmin')
username = user['username']
password = user['password']

user username do
  password "#{password}"
  supports manage_home: true
  home  "/home/#{username}"
  shell '/bin/bash'
  action :create
end

execute 'change-mode' do
  command <<-EOH
    chmod -R g+rwx #{node['was']['was_home']}
  EOH
end

profiles = data_bag('profiles')
profiles.each do |id|
  p = data_bag_item('profiles', id)
  execute "add-service-#{id}" do
    sensitive true
    command <<-EOH
      chown -R #{username} #{node['was']['was_home']}/profiles/#{p['profileName']}
      #{node['was']['was_home']}/bin/wasservice.sh -add #{p['id']} -serverName #{p['serverName']} -profilePath #{node['was']['was_home']}/profiles/#{p['profileName']} -userid #{username} -password #{password}
    EOH
  end
  execute "start-service-#{id}" do
    command <<-EOH
      #{node['was']['was_home']}/bin/wasservice.sh -start #{p['id']}
    EOH
  end
end
