docker network create elk
docker stop `docker ps | grep -i elastic | awk '{print $1}'`
docker stop `docker ps | grep -i kibana | awk '{print $1}'`
docker rm container `docker ps -a | grep -i elastic | awk '{print $1}'`
docker rm container `docker ps -a | grep -i kibana | awk '{print $1}'`
docker run -d --name elasticsearch --net elk -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.2
docker run -d --link elasticsearch:elasticsearch --name kibana --net elk -p 5601:5601 kibana:7.6.2
