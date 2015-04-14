# openig-vagrant
Provide a basic installation for local testing and development for OpenIG using the virtualbox provider.

You will need [Vagrant!](https://www.vagrantup.com/) to run the example. When install is finished OpenIG will be running with IP 192.168.33.14

    git clone https://github.com/zalando/openig-vagrant.git
    vagrant up

Little patience is required. Wait till you see:

    ==> default:  * Starting Tomcat servlet engine tomcat7
    ==> default:    ...done.

## Note
For convenience, set a FQDN in your `/etc/hosts`, like `openig.example.com`

## Did it work?
Check: http://openig.example.com:8080

## Documentation
* http://docs.forgerock.org/en/openig/3.1.0
