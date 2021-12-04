docker

create running container from image and execute bash as the main process
# ti … terminal interactive
docker run -ti ubuntu:latest bash 
docker run -ti ubuntu bash -c "sleep 3; echo all done" 
docker run --name example -d ubuntu bash -c "less /etc/password" 

delete a container after exiting main process
docker run --rm -ti ubuntu sleep 5
docker rm CONTAINER_NAME

create container and let it run detached
# d … detached  
docker run -d -ti ubuntu bash 

attach a detached container
docker attach CONTAINER_NAME

execute a new bash process in an already running container and attach
docker exec -ti CONTAINER_NAME bash

detach from an interactively running container
ctrl-p, ctrl-q

take a look at containers
# a … all
docker ps -a

make image from container
docker commit CONTAINER_ID|CONTAINER_NAME [IMAGE_TAG]

give an image a human readable name
docker tag IMAGE_ID TAG

show the log of one container
docker logs CONTAINER_NAME

kill running container
docker kill CONTAINER_NAME

remove container
docker rm CONTAINER_NAME

expose a port, i.e. map the port of a container to a port of the local machine
         as seen from INSIDE|OUTSIDE the container
docker run --rm -ti -p 45678:45678 -p 45679:45679 --name echo-server ubuntu:14.04 bash

show exposed ports of container
docker port CONTAINER_NAME

set an environment variable
docker run --rm -ti -e SECRET=the-internet-loves-cats --name catserver …

show downloaded images
docker images

remove image
docker rmi IMAGE_NAME

share a folder of the host with a container 
docker run -ti -v /Users/sheiden/example:/etc/example ubuntu bash

search for docker images
docker search postgres
