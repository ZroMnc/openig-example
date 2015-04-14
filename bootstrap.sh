#!/usr/bin/env bash
apt-get update
apt-get install -y unattended-upgrades 
apt-get install -y software-properties-common
# [+] Common Files Done

# [+] Repositories for Oracle Java 7 
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

# [+] Ubuntu Key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# [+] Oracle JDK 7
apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install -y oracle-java7-installer
update-java-alternatives -s java-7-oracle

# [+] Container for OpenIG
apt-get install -y tomcat7
service tomcat7 stop

# [+] Java Environment Variables
echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /home/vagrant/.bashrc
echo "export JAVA_HOME" >> /home/vagrant/.bashrc
echo "export JRE_HOME" >> /home/vagrant/.bashrc
echo "export PATH" >> /home/vagrant/.bashrc

# Download and Configure OpenIG
wget -O /tmp/OpenIG-3.1.0.war https://www.dropbox.com/s/3hpi3mxf69asxxg/OpenIG-3.1.0.war
rm -Rf /var/lib/tomcat7/webapps/ROOT
mv /tmp/OpenIG-3.1.0.war /var/lib/tomcat7/webapps/ROOT.war

# [+] Start OpenIG
service tomcat7 start
# [+] Done
