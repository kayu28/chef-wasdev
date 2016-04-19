#
# Cookbook Name:: was
# Attributes:: default
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

# default attributes
default['was']['working_dir']             = ::File.join(Chef::Config[:file_cache_path], 'was')
default['was']['installer_url']           = nil
default['was']['installer_file']          = 'DEVELOPERSILAN.agent.installer.linux.gtk.x86_64.zip'
default['was']['installer_log']           = '/tmp/im.install.log'
default['was']['installer_version']       = '1.8.1000.20141126_2002'
default['was']['was_home']                = '/opt/IBM/WebSphere/AppServer'
default['was']['was_sharedLocation']      = '/opt/IBM/IMShared'
default['was']['was_languageCode']        = 'ja'
default['was']['repository_url']          = 'http://www.ibm.com/software/repositorymanager/V85WASDeveloperILAN'
