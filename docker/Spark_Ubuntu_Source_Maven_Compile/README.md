
docker build -t test/hadoop-source -f Dockerfile.Ubuntu.14.04 .

docker run -d -t --name hadoop-source test/hadoop-source &> /dev/null

docker exec -it hadoop-source bash

