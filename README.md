# DOCKER-SETUP-ELASTIC-KIBANA
Guide to setup Elastic and Kibana using docker. 

### Prerequisites:
    Docker Engine/Host
    
### Some useful docker commands
    1. docker network create <network_name> : create network. We will be running elastic and kibana in same network.
    2. docker run : create and start container
       -d  run container in bg & prints ID
       -it  interactive,pseudo-TTY
       -p  port mappings
       -e  set env variables
       --name  name your container
       --link  link another container
    3. docker ps : list started containers
       -a  all
    4. docker stop/start <container_name/container_id>
    
#### Network
    docker network create elk
#### ELastic    
    docker run -d 
        --name elasticsearch 
        --net elk 
        -p 9200:9200 
        -p 9300:9300 
        -e "discovery.type=single-node" 
        elasticsearch:7.6.2
http://localhost:9200/_nodes?pretty
#### Kibana
    docker run -d 
        --link elasticsearch:elasticsearch 
        --name kibana 
        --net elk 
        -p 5601:5601 
        kibana:7.6.2
http://localhost:5601/app/kibana


### Run instructions
    chmod +x elk.sh
    ./elk.sh
    
