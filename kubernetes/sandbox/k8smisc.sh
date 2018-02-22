# Run on master, After workers are up
# Crete nginx directory
mkdir nginx
cd nginx

# Config Map
wget https://raw.githubusercontent.com/emc2ehv/containers/master/kubernetes/sandbox/nginx/nginx.properties
kubectl -n nginxspace create configmap nginx-config --from-file=./nginx.properties

# nginx app
wget https://raw.githubusercontent.com/emc2ehv/containers/master/kubernetes/sandbox/nginx/nginx-deployment.yaml
wget https://raw.githubusercontent.com/emc2ehv/containers/master/kubernetes/sandbox/nginx/nginx-svc.yaml
kubectl create namespace nginxspace
kubectl -n nginxspace apply -f ./


# Optional
curl -L -s https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml  | sed 's/targetPort: 8443/targetPort: 8443\n  type: LoadBalancer/' | kubectl apply -f -
