docker network create elk
docker stop `docker ps | grep -i elastic | awk '{print $1}'`
docker stop `docker ps | grep -i kibana | awk '{print $1}'`

