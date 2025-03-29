# script for intall java , jdk , etc on Ubuntu 

#!/bin/bash 

# apt update
sudo apt update

# install OpenJDK 17
sudo apt install -y openjdk-17-jdk

# install Maven
sudo apt install -y maven

# check status
java -version
mvn -v