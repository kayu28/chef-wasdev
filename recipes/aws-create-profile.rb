#
# Cookbook Name:: was
# Recipe:: aws-create-profile
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

cmd = "#{wasHome}/bin/manageprofiles.sh -create -validatePorts true"
cmd << " -templatePath #{wasHome}/profileTemplates/default"
cmd << " -profileName #{node['was']['profile']['profileName']}"
cmd << " -cellName #{node['was']['profile']['cellName']}"
cmd << " -nodeName #{node['was']['profile']['nodeName']}"
cmd << " -serverName #{node['was']['profile']['serverName']}"

if node['was']['profile']['enableAdminSecurity'] == 'true' then
  cmd << " -enableAdminSecurity true"
  cmd << " -adminUserName #{node['was']['profile']['adminUserName']}"
  cmd << " -adminPassword #{node['was']['profile']['adminPassword']}"
end

if node['was']['profile']['hostName']
  cmd << " -hostName #{node['was']['profile']['hostName']}"
end

execute "create-profile" do
  sensitive true
  command "#{cmd}"
end
