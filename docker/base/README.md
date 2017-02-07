# build image

```bash
./build-image-root.sh hadoop-dnsmasq
./build-image-root.sh hadoop-base
./build-image-root.sh hbase-base
```

# Starting Hadoop Container

```bash
$ ./start-container-root.sh hadoop latest 3
# start master container...
# start slave1 container...
```

```bash
$ serf members
# master.hadoop.test.com  172.17.0.2:7946  alive  
# slave1.hadoop.test.com  172.17.0.3:7946  alive
$ cd ~
$ ./configure-members.sh
$ ./start-hadoop.sh
$ jps
$ hdfs dfsadmin -report
```

# Starting HBase Container

```bash
./start-container-root.sh hbase latest 3
# start master container...
# start slave1 container...

# do it in continer
serf members
# master.hbase.test.com  172.17.0.5:7946  alive  
# slave1.hbase.test.com  172.17.0.6:7946  alive  
# slave2.hbase.test.com  172.17.0.7:7946  alive
cd ~
./configure-members.sh
# Starting Hadoop
./start-hadoop.sh
jps
hdfs dfsadmin -report
```

# Start HBase

```bash
cd ~
./start-hbase.sh
```

```bash
hbase(main):001:0> $ status
hbase(main):002:0> $ create 'album','label','image'
hbase(main):003:0> $ put 'album','label1','label:size','10'
hbase(main):004:0> $ put 'album','label1','label:color','255:255:255'
hbase(main):005:0> $ put 'album','label1','label:text','Family album'
hbase(main):006:0> $ put 'album','label1','image:name','holiday'
hbase(main):007:0> $ put 'album','label1','image:source','/tmp/pic1.jpg'
hbase(main):008:0> $ get 'album','label1'
```
