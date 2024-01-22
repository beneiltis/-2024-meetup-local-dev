#!/bin/bash

clear


echo ""
echo ""
echo ""
figlet "K8S"
figlet "Local"
figlet "Development"
figlet "Environments"
echo ""
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."

clear


echo ""
echo ""
echo ""
echo -e "\033[1mBenedikt Iltisberger\033[0m"
echo ""
imgcat bene-head.png --width=50
echo -e "Age:\t\t 40"
echo -e "From:\t\t Neuss/Germany"
echo -e "Job:\t\t DevOps Engineer, Software Developer"
echo -e "Lang:\t\t go, typescript, swift, bash ..."
echo -e "Focus:\t\t DevOps, Backend, ..."
echo -e "Hobbies:\t Kids, Coding, Aquaristics"
echo -e "Email:\t\t bene@mogenius.com"
echo -e "X:\t\t @iltisberger"

echo ""
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."

clear


echo ""
echo ""
echo ""
echo "I'm working at"
echo ""
imgcat mogenius.png --width=100
echo ""
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."

clear

echo ""
echo ""
echo ""
echo -e "\033[1mWhat do local kubernetes Envs look like?\033[0m"
echo ""
echo ""
read -p ""
imgcat drug-abuse.png --width=60
echo ""
echo ""
read -p "Press ENTER to continue..."

clear


echo -e "\033[1mWhat is the problem? Why do we need local Dev Envs?\033[0m"
read -p ""
echo ""
echo ""
echo ""
echo "   =>  k8s is awesome but it is complex for developers"
read -p ""
echo "   =>  Works on my maschine still happens with containers"
read -p ""
echo "   =>  when you just focus on your container you are missing k8s essentials"
read -p ""
echo "   =>  like: configmaps, services, secrets, ingresses, pv's, pvc's, storageclasses, etc."
read -p ""
echo "   =>  Networking is way more complex (VPNs, Firewalls, etc.)"
read -p ""
echo "   =>  More:"
read -p ""
echo "       -  🚀 Speed: way faster to build it on your maschine for your maschine"
read -p ""
echo "       -  💰 Costs: all components can run in your maschine"
read -p ""
echo "       -  🌱 Energy: reduce your CO2 footprint"
read -p ""
echo "       -  🛜  Bandwidth: low/limited bandwidth are less problematic (welcome to germany)"
read -p ""
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."

clear 

echo ""
echo ""
echo ""
echo -e "\033[1mDemo Time ...\033[0m"
echo ""
imgcat demo-time.png --width=80
read -p "Press ENTER to continue..."

clear 

# Create Code
echo ""
echo ""
echo ""
echo -e "\033[1mCreate a simple operator\033[0m"
echo ""
echo ""
bat go/main.go
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."
echo ""
echo ""

cd go
go run main.go
cd ..

echo ""
echo ""
read -p "Press ENTER to continue..."

clear

echo ""
echo ""
echo ""
echo -e "\033[1m Lets Create a Container\033[0m"
echo ""
echo ""
bat go/Dockerfile
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."
echo ""
echo ""

docker build -t meetup-operator -f go/Dockerfile go/.
docker images ls --filter=reference='meetup-operator'

echo ""
echo ""
read -p "Press ENTER to continue..."


clear
echo ""
echo ""
echo ""
echo -e "\033[1m Kubernetes Manifests\033[0m"
echo ""
echo ""
clear 
pwd
bat manifests/deploy.yaml
echo ""
echo ""
read -p "Press ENTER to continue..."

clear
echo ""
echo ""
echo ""
echo -e "\033[1m Kubernetes Manifests\033[0m"
echo ""
echo ""
clear 
bat manifests/service.yaml
echo ""
echo ""
read -p "Press ENTER to continue..."

clear
echo ""
echo ""
echo ""
echo -e "\033[1m Kubernetes Manifests\033[0m"
echo ""
echo ""
clear 
bat manifests/ingress.yaml
echo ""
echo ""
read -p "Press ENTER to continue..."



clear
echo ""
echo ""
echo ""
echo -e "\033[1m Apply to K8s ...\033[0m"
echo ""
echo ""
set -x
kubectl apply -f manifests/deploy.yaml
kubectl apply -f manifests/service.yaml
kubectl apply -f manifests/ingress.yaml
echo ""
echo ""
read -p "Press ENTER to continue..."


clear
echo ""
echo ""
echo ""
echo -e "\033[1m Lets check out in K9s what we got\033[0m"
echo ""
echo ""
echo ""
echo "🔍 k9s"
echo "⚠️  update image + imagePullPolicy"
echo ""
echo ""
echo ""
read -p "Press ENTER to continue..."


clear 
# THANK YOU
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
figlet "Thank you"

docker rmi meetup-operator
kubectl delete deployment meetup-operator
kubectl delete service meetup-service
kubectl delete ingress meetup-ingress