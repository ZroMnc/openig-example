#!/usr/bin/env bash
apt-get update
apt-get install -y unattended-upgrades 
apt-get install -y software-properties-common
# [+] Common Files Done

# [+] Java Environment Variables
echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /home/vagrant/.bashrc
echo "export JAVA_HOME" >> /home/vagrant/.bashrc
echo "export JRE_HOME" >> /home/vagrant/.bashrc
echo "export PATH" >> /home/vagrant/.bashrc
echo "127.0.0.1 ig.example.com" >> /etc/hosts

### - OPENIG - config home dir
# This gave me a hard time
# "export OPENIG_BASE=/path/to/openig" (dir to folder starting with .openig)
# Docu says $HOME but this defaults to /usr/share/tomcat
# Have tried setting manually but still. -> Docu acutally good here
###

# [+] Install Tomcat 7 - container for OpenIG
apt-get install -y tomcat7
service tomcat7 stop

# [+] Download and Configure OpenIG
wget -O /tmp/OpenIG-3.1.0.war https://www.dropbox.com/s/3hpi3mxf69asxxg/OpenIG-3.1.0.war
rm -Rf /var/lib/tomcat7/webapps/ROOT
mv /tmp/OpenIG-3.1.0.war /var/lib/tomcat7/webapps/ROOT.war

# [+] Create OpenIG configuration
mkdir -p /usr/share/tomcat7/.openig/config/routes 
mv /home/vagrant/config.json /usr/share/tomcat7/.openig/config/config.json
mv /home/vagrant/99-default.json /usr/share/tomcat7/.openig/config/routes/99-default.json
mv /home/vagrant/01-static.json /usr/share/tomcat7/.openig/config/routes/01-static.json

# [+] Download Example App
wget -O /tmp/openig.jar http://maven.forgerock.org/repo/releases/org/forgerock/openig/openig-doc-samples/3.1.0/openig-doc-samples-3.1.0-jar-with-dependencies.jar
mv /tmp/openig.jar /home/vagrant/openig.jar
java -jar openig.jar &

# [+] Start OpenIG
service tomcat7 start
# [+] Done
