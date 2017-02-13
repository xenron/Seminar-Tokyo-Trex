# hadoop-docker

# MacOS

```bash
$ ./build-image-root.sh base-dnsmasq
$ ./build-image-root.sh hadoop-base
$ ./build-image-root.sh hbase-base
```

```bash
$ ./start-container-root.sh latest 3
# start master container...
# start slave1 container...
# start slave2 container...
```

```bash
$ serf members
# master.test.com  172.17.0.2:7946  alive  
# slave1.test.com  172.17.0.3:7946  alive
# slave2.test.com  172.17.0.4:7946  alive
$ cd ~
$ ./configure-members.sh
$ ./start-hadoop.sh
$ jps
$ hdfs dfsadmin -report
```


# Ubuntu 14.04

```bash
$ ./build-image.sh hadoop-dnsmasq
```

```bash
$ ./start-container.sh latest 3
# start master container...
# start slave1 container...
# start slave2 container...
```

```bash
$ serf members
# master.test.com  172.17.0.2:7946  alive  
# slave1.test.com  172.17.0.3:7946  alive
# slave2.test.com  172.17.0.4:7946  alive
$ cd ~
$ ./configure-members.sh
$ ./start-hadoop.sh
$ jps
$ hdfs dfsadmin -report
```

