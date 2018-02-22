yum install -y wget
kubeadm init --apiserver-advertise-address $(hostname -i) >> /tmp/kudeadminit.out
chmod 777 /tmp/kudeadminit.out
useradd kubeadmtest
mkdir -p /home/kubeadmtest/.kube
cp -i /etc/kubernetes/admin.conf /home/kubeadmtest/.kube/config
chown -R kubeadmtest:kubeadmtest /home/kubeadmtest/.kube/
su - kubeadmtest
kubectl apply -n kube-system -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
echo "--------------------------------------------------------------------------------------------------" >> /tmp/kudeadminit.out
echo "Your Kubernetes master is ready. Please allow up to a minute for the Cluster and WebUI to come up" >> /tmp/kudeadminit.out
echo "Your worker nodes can join this master by running the following command as root" >> /tmp/kudeadminit.out
awk '/kubeadm join/' /tmp/kudeadminit.out >> /tmp/kudeadminit.out
clear
cat /tmp/kudeadminit.out

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
