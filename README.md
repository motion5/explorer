# Basic API Exploerer
An example of a basic microservices architecture to be deployed with Kubernetes

## To Run
### Docker Compose

#### Up
```
    docker-compose -f "docker-compose.yml" up -d --build
```
#### Down
```
    docker-compose -f "docker-compose.yml" down 
```

## Additions and considerations from setup in EKS cluster
- IP's change each time you spin up new ec2 so would need to allow for this so If connecting to an outside instance we would need static IPs so we know what IPs to whitelist on the Database cloud service