# Speaker Notes

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