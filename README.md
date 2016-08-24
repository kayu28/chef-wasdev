# chef-wasdev

This cookbook installs the Websphere Application Server for Developers and sets up profiles.

Requirements
------------

#### platforms
- Red Hat Enterprise Linux 7
- CentOS 6+
- Ubuntu 14+

Attributes
----------

#### install
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['was']['installer_url']</tt></td>
    <td>String</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['installer_file']</tt></td>
    <td>String</td>
    <td><tt>DEVELOPERSILAN.agent.installer.linux.gtk.x86_64.zip</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['installer_log']</tt></td>
    <td>String</td>
    <td><tt>/tmp/im.install.log</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['installer_version']</tt></td>
    <td>String</td>
    <td><tt>1.8.1000.20141126_2002</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['was_home']</tt></td>
    <td>String</td>
    <td><tt>/opt/IBM/WebSphere/AppServer</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['was_sharedLocation']</tt></td>
    <td>String</td>
    <td><tt>/opt/IBM/IMShared</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['was_languageCode']</tt></td>
    <td>String</td>
    <td><tt>ja</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['repository_url']</tt></td>
    <td>String</td>
    <td><tt>http://www.ibm.com/software/repositorymanager/V85WASDeveloperILAN</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['ibmuser']</tt></td>
    <td>String</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['ibmpassword']</tt></td>
    <td>String</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

#### create-profile
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['was']['profile']['profileName']</tt></td>
    <td>String</td>
    <td><tt>AppSrv01</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['cellName']</tt></td>
    <td>String</td>
    <td><tt>node01Cell</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['nodeName']</tt></td>
    <td>String</td>
    <td><tt>node01</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['serverName']</tt></td>
    <td>String</td>
    <td><tt>server1</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['enableAdminSecurity']</tt></td>
    <td>String</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['adminUserName']</tt></td>
    <td>String</td>
    <td><tt>wasadmin</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['adminPassword']</tt></td>
    <td>String</td>
    <td><tt>wasadmin</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['profile']['hostName']</tt></td>
    <td>String</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['admin']['username']</tt></td>
    <td>String</td>
    <td><tt>wasadmin</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['admin']['password']</tt></td>
    <td>String</td>
    <td><tt>wasadmin</tt></td>
  </tr>
</table>

#### configure-datasource
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['was']['auth']['alias']</tt></td>
    <td>String</td>
    <td><tt>DB2AUTH</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['auth']['dbuser']</tt></td>
    <td>String</td>
    <td><tt>db2inst1</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['auth']['dbpassword']</tt></td>
    <td>String</td>
    <td><tt>db2inst1</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['provider']['name']</tt></td>
    <td>String</td>
    <td><tt>jdbcProvider</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['provider']['db2driver_url']</tt></td>
    <td>String</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['datasource']['name']</tt></td>
    <td>String</td>
    <td><tt>db2-ds</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['datasource']['jndi']</tt></td>
    <td>String</td>
    <td><tt>jdbc/db2-ds</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['datasource']['database']</tt></td>
    <td>String</td>
    <td><tt>sample</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['datasource']['hostname']</tt></td>
    <td>String</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['datasource']['port']</tt></td>
    <td>String</td>
    <td><tt>50000</tt></td>
  </tr>
  <tr>
    <td><tt>['was']['datasource']['schema']</tt></td>
    <td>String</td>
    <td><tt>db2inst1</tt></td>
  </tr>
</table>

Usage
------------

#### Berksfile
    source "https://api.berkshelf.com/"
    
    cookbook "was"  , github: "kayu28/chef-wasdev"
