#!/bin/bash
kubectl apply -f ./
echo "Launching K8s Dashboard"
for i in `seq 1 10`;
do
	echo -n "."
	sleep 1
done
echo
echo "Launch Complete"
echo "Dashboard available at"
kubectl -n kube-system describe service kubernetes-dashboard|awk '/^IP|^Port/ {print;}'
echo "Dashboard Access Token is"
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret|awk '/^namespace-controller-token/ {print $1}')|awk '/^token:/ {print $2}'
