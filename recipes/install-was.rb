#
# Cookbook Name:: wasdev
# Recipe:: install-was
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

ibmuser       = node['wasdev']['ibmUser']
ibmpassword   = node['wasdev']['ibmPassword']

unless ibmuser
  Chef::Application.fatal!("The IBM User ID is required.")
end

unless ibmpassword
  Chef::Application.fatal!("The IBM Password is required.")
end

workDir      = node['wasdev']['workingDir']
passwdFile   = node['wasdev']['masterPasswordFile']
masterPasswd = node['wasdev']['masterPassword']
storageFile  = node['wasdev']['storageFile']
url          = node['wasdev']['was']['repository']
responseFile = "#{workDir}/install-was.xml"
imutilsc     = '/opt/IBM/InstallationManager/eclipse/tools/imutilsc'
imcl         = '/opt/IBM/InstallationManager/eclipse/tools/imcl'

package 'unzip'

directory "#{workDir}" do
  action :create
end

execute 'save-credential' do
  action :nothing
  sensitive true
  command "#{imutilsc} saveCredential -secureStorageFile #{storageFile} -masterPasswordFile #{passwdFile} -userName #{ibmuser} -userPassword #{ibmpassword} -url #{url}"
end

execute 'was-install' do
  action :nothing
  command "#{imcl} -acceptLicense -input #{responseFile} -secureStorageFile #{storageFile} -masterPasswordFile #{passwdFile} -log #{node['wasdev']['was']['installLog']}"
end

file "#{passwdFile}" do
  content "#{masterPasswd}"
  mode '0755'
  owner 'root'
  group 'root'
end

template "#{responseFile}" do
  owner 'root'
  group 'root'
  mode "0644"
  notifies :run, "execute[save-credential]", :immediately
  notifies :run, "execute[was-install]", :immediately
end

directory "#{workDir}" do
  recursive true
  action :delete
end
