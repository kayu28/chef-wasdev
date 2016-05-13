#
# Cookbook Name:: was
# Recipe:: create-profile
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

wasHome = node['was']['was_home']
profile = node['was']['profile']
admin   = node['was']['admin']
username = admin['username']
password = admin['password']

cmd = "#{wasHome}/bin/manageprofiles.sh -create -validatePorts true"
cmd << " -templatePath #{wasHome}/profileTemplates/default"
cmd << " -profileName #{profile['profileName']}"
cmd << " -cellName #{profile['cellName']}"
cmd << " -nodeName #{profile['nodeName']}"
cmd << " -serverName #{profile['serverName']}"

if profile['enableAdminSecurity'] == 'true' then
  cmd << " -enableAdminSecurity true"
  cmd << " -adminUserName #{profile['adminUserName']}"
  cmd << " -adminPassword #{profile['adminPassword']}"
end

if profile['hostName']
  cmd << " -hostName #{profile['hostName']}"
end

execute "create-profile" do
  action :nothing
  sensitive true
  command "#{cmd}"
end

execute 'change-mode' do
  action :nothing
  command <<-EOH
    chmod -R g+rwx #{wasHome}
  EOH
end

execute "add-service" do
  sensitive true
  action :nothing
  command <<-EOH
    chown -R #{username} #{wasHome}/profiles/#{profile['profileName']}
    #{wasHome}/bin/wasservice.sh -add default -serverName #{profile['serverName']} -profilePath #{wasHome}/profiles/#{profile['profileName']} -userid #{username} -password #{password}
    #{wasHome}/bin/wasservice.sh -start default
  EOH
end

user username do
  password "#{password}"
  supports manage_home: true
  home  "/home/#{username}"
  shell '/bin/bash'
  action :create
  notifies :run, "execute[create-profile]", :immediately
  notifies :run, "execute[change-mode]", :immediately
  notifies :run, "execute[add-service]", :immediately
end
