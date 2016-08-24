#
# Cookbook Name:: was
# Recipe:: install
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

# ------------------------------------------------------
# Check required attribute.
# ------------------------------------------------------
unless node['was']['repository_url']
  Chef::Application.fatal!("The repository url attribute is required.")
end

ibmuser       = node['was']['ibmuser']
ibmpassword   = node['was']['ibmpassword']

unless ibmuser
  Chef::Application.fatal!("The IBM User ID attribute is required.")
end

unless ibmpassword
  Chef::Application.fatal!("The IBM Password attribute is required.")
end

installer     = node['was']['installer_file']
url           = node['was']['repository_url']
work_dir      = node['was']['working_dir']
passwd_file   = node['was']['passwd_file']
storage_file  = node['was']['storage_file']
response_file = "#{work_dir}/install.xml"

# ------------------------------------------------------
# Install Websphere Application Server for Developers.
# ------------------------------------------------------

package 'unzip'

directory "#{work_dir}" do
  action :create
end

execute 'save-credential' do
  action :nothing
  sensitive true
  command "#{work_dir}/im/tools/imutilsc saveCredential -secureStorageFile #{storage_file} -masterPasswordFile #{passwd_file} -userName #{ibmuser} -userPassword #{ibmpassword} -url #{url}"
end

execute 'extract' do
  action :nothing
  command "unzip -qd #{work_dir}/im #{work_dir}/#{installer}"
end

execute 'was-install' do
  action :nothing
  command "#{work_dir}/im/installc -acceptLicense -input #{response_file} -secureStorageFile #{storage_file} -masterPasswordFile #{passwd_file} -log #{node['was']['installer_log']}"
end

template "#{response_file}" do
  owner 'root'
  group 'root'
  mode "0644"
  variables({
    :installer_location => "#{work_dir}/im"
  })
end

file "#{passwd_file}" do
  content 'This text is the master password.'
  mode '0755'
  owner 'root'
  group 'root'
end

remote_file File.join(work_dir, installer) do
  source node['was']['installer_url']
  owner 'root'
  group 'root'
  mode '0755'
  not_if "test -e #{work_dir}/#{installer}"
  notifies :run, "execute[extract]", :immediately
  notifies :run, "execute[save-credential]", :immediately
  notifies :run, "execute[was-install]", :immediately
end

# ------------------------------------------------------
# Delete tmp file.
# ------------------------------------------------------
directory "#{work_dir}" do
  recursive true
  action :delete
end
