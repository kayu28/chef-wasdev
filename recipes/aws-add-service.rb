#
# Cookbook Name:: was
# Recipe:: aws-add-service
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

username = node['was']['admin']['username']
password = node['was']['admin']['password']
profileName = node['was']['profile']['profileName']
serverName = node['was']['profile']['serverName']

execute 'change-mode' do
  action :nothing
  command <<-EOH
    chmod -R g+rwx #{node['was']['was_home']}
  EOH
end

execute "add-service" do
  sensitive true
  action :nothing
  command <<-EOH
    chown -R #{username} #{node['was']['was_home']}/profiles/#{profileName}
    #{node['was']['was_home']}/bin/wasservice.sh -add default -serverName #{serverName} -profilePath #{node['was']['was_home']}/profiles/#{profileName} -userid #{username} -password #{password}
    #{node['was']['was_home']}/bin/wasservice.sh -start default
  EOH
end

user username do
  password "#{password}"
  supports manage_home: true
  home  "/home/#{username}"
  shell '/bin/bash'
  action :create
  notifies :run, "execute[change-mode]", :immediately
  notifies :run, "execute[add-service]", :immediately
end
