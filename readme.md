# ToC

# Personal Introduction
    - short infos on me
# Where do i work?
    - We are a small company in the heart of cologne the creates a kubernetes operations platform
# I feeded ChatGpt to draw what Kubernetes Local Dev Environment look like.
    - my idea was to make it easy for you guys to understand what i am talking about
    - I was shocked by the result
    - The AI thinks we are struggeling with drug addiction
    - skrew it. lets do this the old fashioned way
# Problem
    - You work with docker and it addresses the problem of "it works on my machine"
    - But in reality it is still "it works on my machine, but not on the server"
    - Especially when it comes to kubernetes
    - Missing architecutre, missing config, missing secrets, missing ingress, missing ...
    - You have to endure log waiting times for builds and deployments
    - It is expensive to run a cluster
    - You can fuck up your cluster easily
    - KinD/k3s/minicube comes to the rescue
    - But now you face 100 new problems
    - Localhost doesnt support https (private ip cannot optain certificates)
    - when i docker build locally how can i use the my image without pushing it again (maybe even reuse my docker desktop as container registry)
    - subnet problems. local inside you cluster is something diffrent than on your maschine ...
    - etc. etc. etc.
# Solution
    - Do it!
# Demo
# Lets create an Operator

# BUILD
go run main.go

# TEST
curl -s http://localhost:8080/healthz | jq

# JUST IN CASE
sudo lsof -i :8080

# DOCKER BUILD
docker build -t meetup-operator -f go/Dockerfile go/.

# KUBECTL APPLY
kubectl apply -f manifests/deploy.yaml
kubectl apply -f manifests/service.yaml
kubectl apply -f manifests/ingress.yaml

# Oh noooo no https for localhost
nslookup test.local.mogenius.io