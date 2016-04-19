# chef-wasdev

This cookbook installs the Websphere Application Server for Developers and sets up profiles.

Requirements
------------

#### platforms
- `CentOS` - tested on CentOS 6.7

Attributes
----------

#### was::default
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
</table>
