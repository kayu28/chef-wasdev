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
default['was']['working_dir']                    = ::File.join(Chef::Config[:file_cache_path], 'was')
default['was']['installer_url']                  = nil
default['was']['installer_file']                 = 'DEVELOPERSILAN.agent.installer.linux.gtk.x86_64.zip'
default['was']['installer_log']                  = '/tmp/im.install.log'
default['was']['installer_version']              = '1.8.1000.20141126_2002'
default['was']['passwd_file']                    = '/var/master_password.txt'
default['was']['storage_file']                   = '/var/credential.store'
default['was']['was_home']                       = '/opt/IBM/WebSphere/AppServer'
default['was']['was_sharedLocation']             = '/opt/IBM/IMShared'
default['was']['was_languageCode']               = 'ja'
default['was']['repository_url']                 = 'http://www.ibm.com/software/repositorymanager/V85WASDeveloperILAN'
default['was']['ibmuser']                        = nil
default['was']['ibmpassword']                    = nil

default['was']['profile']['profileName']         = 'AppSrv01'
default['was']['profile']['cellName']            = 'node01Cell'
default['was']['profile']['nodeName']            = 'node01'
default['was']['profile']['serverName']          = 'server1'
default['was']['profile']['enableAdminSecurity'] = 'true'
default['was']['profile']['adminUserName']       = 'wasadmin'
default['was']['profile']['adminPassword']       = 'wasadmin'
default['was']['profile']['hostName']            = nil

default['was']['admin']['username']              = 'wasadmin'
default['was']['admin']['password']              = 'wasadmin'

default['was']['auth']['alias']                  = 'DB2AUTH'
default['was']['auth']['dbuser']                 = 'db2inst1'
default['was']['auth']['dbpassword']             = 'db2inst1'

default['was']['provider']['name']               = 'jdbcProvider'
default['was']['provider']['db2driver_url']      = nil

default['was']['datasource']['name']             = 'db2-ds'
default['was']['datasource']['jndi']             = 'jdbc/db2-ds'
default['was']['datasource']['database']         = 'sample'
default['was']['datasource']['hostname']         = nil
default['was']['datasource']['port']             = '50000'
default['was']['datasource']['schema']           = 'db2inst1'
