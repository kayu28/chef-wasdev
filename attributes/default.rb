#
# Cookbook Name:: wasdev
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
default['wasdev']['workingDir']                            = ::File.join(Chef::Config[:file_cache_path], 'wasdev')
default['wasdev']['masterPasswordFile']                    = '/var/master_password.txt'
default['wasdev']['masterPassword']                        = 'password'
default['wasdev']['storageFile']                           = '/var/credential.store'
default['wasdev']['ibmUser']                               = nil
default['wasdev']['ibmPassword']                           = nil
default['wasdev']['sharedLocation']                        = '/opt/IBM/IMShared'

default['wasdev']['iim']['installerUrl']                   = nil

default['wasdev']['was']['home']                           = '/opt/IBM/WebSphere/AppServer'
default['wasdev']['was']['languageCode']                   = 'ja'
default['wasdev']['was']['repository']                     = 'http://www.ibm.com/software/repositorymanager/V9WASILAN'
default['wasdev']['was']['installLog']                     = '/tmp/im.install.log'

default['wasdev']['was']['profile']['profileName']         = 'AppSrv01'
default['wasdev']['was']['profile']['cellName']            = 'node01Cell'
default['wasdev']['was']['profile']['nodeName']            = 'node01'
default['wasdev']['was']['profile']['serverName']          = 'server1'
default['wasdev']['was']['profile']['enableAdminSecurity'] = 'true'
default['wasdev']['was']['profile']['adminUserName']       = 'wasadmin'
default['wasdev']['was']['profile']['adminPassword']       = 'wasadmin'
default['wasdev']['was']['profile']['hostName']            = nil

default['wasdev']['was']['admin']['username']              = 'wasadmin'
default['wasdev']['was']['admin']['password']              = 'wasadmin'

default['wasdev']['was']['auth']['alias']                  = 'DB2AUTH'
default['wasdev']['was']['auth']['dbuser']                 = 'db2inst1'
default['wasdev']['was']['auth']['dbpassword']             = 'db2inst1'

default['wasdev']['was']['provider']['name']               = 'jdbcProvider'
default['wasdev']['was']['provider']['db2driverUrl']       = nil

default['wasdev']['was']['datasource']['name']             = 'db2-ds'
default['wasdev']['was']['datasource']['jndi']             = 'jdbc/db2-ds'
default['wasdev']['was']['datasource']['database']         = 'sample'
default['wasdev']['was']['datasource']['hostname']         = nil
default['wasdev']['was']['datasource']['port']             = '50000'
default['wasdev']['was']['datasource']['schema']           = 'db2inst1'
