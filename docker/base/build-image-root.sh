#!/bin/bash

image=$1
tag='latest'


if [ $1 = 0 ]
then
	echo "Please use image name as the first argument!"
	exit 1
fi

# founction for delete images
function docker_rmi()
{
	echo -e "\n\ndocker rmi test/$1:$tag"
	docker rmi test/$1:$tag
}


# founction for build images
function docker_build()
{
	cd $1
	echo -e "\n\ndocker build -t test/$1:$tag ."
	# /usr/bin/time -f "real  %e" docker build -t test/$1:$tag .
	docker build -t test/$1:$tag .
	cd ..
}

echo -e "\ndocker rm -f slave1.hadoop.test.com slave2.hadoop.test.com master.hadoop.test.com"
docker rm -f slave1.hadoop.test.com slave2.hadoop.test.com master.hadoop.test.com

docker images > images.txt

#all image is based on dnsmasq. master and slaves are based on base image.
if [ $image == "hadoop-dnsmasq" ]
then
    docker_rmi hadoop-dnsmasq
    docker_build hadoop-dnsmasq
elif [ $image == "hadoop-base" ]
then
    docker_rmi hadoop-master
    docker_rmi hadoop-slave
    docker_rmi hadoop-base
    docker_build hadoop-base
    docker_build hadoop-master
    docker_build hadoop-slave
elif [ $image == "hadoop-master" ]
then
    docker_rmi hadoop-master
    docker_build hadoop-master
elif [ $image == "hadoop-slave" ]
then
    docker_rmi hadoop-slave
    docker_build hadoop-slave
elif [ $image == "hbase-base" ]
then
    docker_rmi hbase-master
    docker_rmi hbase-slave
    docker_rmi hbase-base
    docker_build hbase-base
    docker_build hbase-master
    docker_build hbase-slave
elif [ $image == "hbase-master" ]
then
    docker_rmi hbase-master
    docker_build hbase-master
elif [ $image == "hbase-slave" ]
then
    docker_rmi hbase-slave
    docker_build hbase-slave
else
	echo "The image name is wrong!"
fi

#docker_rmi hadoop-hbase-base

echo -e "\nimages before build"
cat images.txt
rm images.txt

echo -e "\nimages after build"
docker images


