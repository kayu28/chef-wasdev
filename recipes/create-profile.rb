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

profiles = data_bag('profiles')
profiles.each do |id|
  p = data_bag_item('profiles', id)
  cmd = "#{wasHome}/bin/manageprofiles.sh -create -validatePorts true"
  cmd << " -templatePath #{wasHome}/profileTemplates/default"
  cmd << " -profileName #{p['profileName']}"
  cmd << " -cellName #{p['cellName']}"
  cmd << " -nodeName #{p['nodeName']}"
  cmd << " -serverName #{p['serverName']}"
  if p['enableAdminSecurity'] == 'true' then
    cmd << " -enableAdminSecurity true"
    cmd << " -adminUserName #{p['adminUserName']}"
    cmd << " -adminPassword #{p['adminPassword']}"
  end
  if p['hostName']
    cmd << " -hostName #{p['hostName']}"
  end
  execute "create-profile-#{id}" do
    sensitive true
    command "#{cmd}"
  end
end
