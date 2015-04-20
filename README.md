# openig-vagrant
Provide a basic installation for local testing and development of OpenIG using the virtualbox provider.

You will need [Vagrant](https://www.vagrantup.com/) to run the example. When install is finished OpenIG will be running with IP 192.168.33.14

    git clone https://github.com/zalando/openig-vagrant.git
    vagrant up

Little patience is required. Wait till you see:

    ==> default:  * Starting Tomcat servlet engine tomcat7
    ==> default:    ...done.

## Did it work?
Check: https://192.168.33.14:8443

## Documentation
* http://docs.forgerock.org/en/openig/3.1.0
