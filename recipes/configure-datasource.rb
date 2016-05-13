#
# Cookbook Name:: was
# Recipe:: configure-datasource
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
p = node['was']['profile']
a = node['was']['auth']
script = "/tmp/dataSourceConfig.py"

cmd_wsadmin = "#{wasHome}/profiles/#{p['profileName']}/bin/wsadmin.sh -conntype SOAP -lang jython"
if p['enableAdminSecurity'] == 'true' then
  cmd_wsadmin << " -username #{p['adminUserName']}"
  cmd_wsadmin << " -password #{p['adminPassword']}"
end

execute "setup" do
  action :nothing
  command <<-EOH
    #{cmd_wsadmin} -profile #{script} -c "setup()"
  EOH
end

template "#{script}" do
  owner 'root'
  group 'root'
  mode "0644"
  variables({
    :jdbc_driver_path => "#{wasHome}/lib/ext"
  })
  notifies :run, "execute[setup]", :immediately
end
