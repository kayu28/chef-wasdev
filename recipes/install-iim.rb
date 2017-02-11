#
# Cookbook Name:: wasdev
# Recipe:: install-iim
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

unless node['wasdev']['iim']['installerUrl']
  Chef::Application.fatal!("The installer url is required.")
end

workdir   = node['wasdev']['workingDir']
# installer = node['wasdev']['iim']['installerFile']
installer = 'agent.installer.zip'

package 'unzip'

directory "#{workdir}" do
  action :create
end

execute 'extract' do
  action :nothing
  command "unzip -qd #{workdir}/im #{workdir}/#{installer}"
end

execute 'iim-install' do
  action :nothing
  command "#{workdir}/im/installc -acceptLicense"
end

remote_file File.join(workdir, installer) do
  source node['wasdev']['iim']['installerUrl']
  owner 'root'
  group 'root'
  mode '0755'
  not_if "test -e #{workdir}/#{installer}"
  notifies :run, "execute[extract]", :immediately
  notifies :run, "execute[iim-install]", :immediately
end

directory "#{workdir}" do
  recursive true
  action :delete
end
