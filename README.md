# openig-example

Example setup from the documentation incl. example to get going. Based on
[gargravarr](https://github.com/gargravarr) Vagrant Box but without the SSL environment.
Also stripped the $racle jre - now its using then OpenJDK - which does reduce the time during vagrant up.



### How to run
You should add the IG url to your host file for ease of use.
```bash
vi /etc/hosts
```

```bash
127.0.0.1 ig.example.com
```

Also 

#### Endpoints

*OpenIG*
* http://ig.example.com:8080
* http://ig.example.com:8080/static

*Protected App*
* http://ig.example.com:8081

#### MYSQL Extention

This helped a lot for testing - [Sample Data](http://www.mysqltutorial.org/mysql-sample-database.aspx)
