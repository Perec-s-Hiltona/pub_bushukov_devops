#### demo 
spring-boot application + Dockerfile

#### scripts 
scripts for installation Docker , Java , etc 

#### how to build Docker image
```
cd demo/
sudo docker build -t spring-boot-app .
```

#### how to run Docker image
```
sudo docker run -d -p 8080:8080 spring-boot-app
```

#### how to check 
```
sudo docker image ls
sudo docker container ls
```

go to [link](http://127.0.0.1:8080/hello)