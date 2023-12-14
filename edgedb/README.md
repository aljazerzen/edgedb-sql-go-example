# EdgeDB example database

To start, run:

```sh
$ docker-compile up
```

To link to the docker instance, run:

```
$ edgedb instance link
Specify the host of the server [default: localhost]: 
> localhost
Specify the port of the server [default: 5656]: 
> 5656
Specify the database user [default: edgedb]: 
> edgedb
Specify the database name [default: edgedb]: 
> edgedb
Unknown server certificate: SHA1:738b40fadbe39888f0edc23faf2f27f14cab4e6c. Trust? [y/N]
> y
Specify a new instance name for the remote server [default: localhost]: 
> docker
Successfully linked to remote instance. To connect run:
  edgedb -I docker
```

To populate with schema and sample data, run:

```
edgedb -I docker migration apply
edgedb -I docker query -f setup.edgeql
```
