# Install Oracle DB on macOS Mojave

### Prerequisites:

- Docker is installed
- Kitematic is installed
- XCode Command Line tools is installed
- SqlDeveloper is installed

### Steps:

[Download RPM Package for 18c XE!](https://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html)

```
-- Clone repo
git clone git@github.com:fuzziebrain/docker-oracle-xe.git

-- Set the working directory to the project folder
cd docker-oracle-xe

-- Copy the RPM to docker-odb18c-xe/files
cp ~/Downloads/oracle-database-xe-18c-1.0-1.x86_64.rpm files/

-- Build Image
docker build -t oracle-xe:18c .

-- Create Container Network
docker network create oracle_network

-- Run Container
sudo docker run -d \
  # map local :32118 to container :1521 
  -p 32118:1521 \
  # map local :35515 to container :5500 (SQLDeveloper)
  -p 35518:5500 \
  # set password for "SYS", "SYSTEM", "PDB_ADMIN"
  -e ORACLE_PWD=Oracle18 \
  # set name of container to "oracle-xe"
  --name=oracle-xe \
  # store data files in given folder
  --volume ~/Iteratec\ GmbH/BMJ/docker/oracle-user-data:/opt/oracle/oradata \
  --network=oracle_network \
  # oracle-xe:18c the image we built earlier
  oracle-xe:18c
  ```

In SqlDeveloper create connection named `Oracle18c` using username `SYSTEM`, password `Oracle18`, hostname `localhost`,  port `32118` and SID `XE`.

