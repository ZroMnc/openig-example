#!/usr/bin/env bash
apt-get update
apt-get install -y unattended-upgrades 
apt-get install -y software-properties-common
apt-get install -y jetty
# [+] Common Files Done

# [+] Repositories for Oracle Java 7 
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
#echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

# [+] Ubuntu Key
#apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# [+] Oracle JDK 7
#apt-get update
#echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#apt-get install -y oracle-java7-installer
#update-java-alternatives -s java-7-oracle

# [+] Java Environment Variables
echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /home/vagrant/.bashrc
echo "export JAVA_HOME" >> /home/vagrant/.bashrc
echo "export JRE_HOME" >> /home/vagrant/.bashrc
echo "export PATH" >> /home/vagrant/.bashrc
echo "alias e=exit" >> /home/vagrant/.bashrc

# [+] Install Tomcat 7 - container for OpenIG
#apt-get install -y tomcat7
#service tomcat7 stop

# [+] Download and Configure OpenIG
#wget -O /tmp/OpenIG-3.1.0.war https://www.dropbox.com/s/3hpi3mxf69asxxg/OpenIG-3.1.0.war
#rm -Rf /var/lib/tomcat7/webapps/ROOT
mv /tmp/OpenIG-3.1.0.war /var/lib/jetty/webapps/root.war

# [+] Create OpenIG configuration
mkdir -p /home/vagrant/.openig/config/routes 
mv /home/vagrant/config.json /home/vagrant/.openig/config/config.json
mv /home/vagrant/99-default.json /home/vagrant/.openig/config/routes/99-default.json

# [+] Download Example App
#wget -O /tmp/openig.jar http://maven.forgerock.org/repo/releases/org/forgerock/openig/openig-doc-samples/3.1.0/openig-doc-samples-3.1.0-jar-with-dependencies.jar
mv /tmp/openig.jar /home/vagrant/openig.jar
java -jar openig.jar &

# [+] Create self signed certificate for https
#mkdir -p /usr/share/ssl
#keytool -genkey -alias tomcat -dname "CN=CA, OU=IAM, O=Zalando SE, L=Berlin, S=Berlin, C=DE" -keyalg RSA -keystore /usr/share/ssl/sslstore -keypass changeme -storepass changeme

# [+] Modify Tomcat configuration accordingly
#mv -f /home/vagrant/server.xml /etc/tomcat7/server.xml

# [+] Start OpenIG
#service tomcat7 start
# [+] Done
