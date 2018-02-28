#!/bin/bash
yum install -y wget sudo
kubeadm init --apiserver-advertise-address $(hostname -i) >> /tmp/kudeadminit.out
chmod 777 /tmp/kudeadminit.out
useradd kubeadmtest
mkdir -p /home/kubeadmtest/.kube
cp -i /etc/kubernetes/admin.conf /home/kubeadmtest/.kube/config
chown -R kubeadmtest:kubeadmtest /home/kubeadmtest/.kube/
sudo -u kubeadmtest kubectl apply -n kube-system -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
echo "--------------------------------------------------------------------------------------------------" >> /tmp/kudeadminit.out
echo "Your Kubernetes master is ready. Please allow up to a minute for the Cluster and WebUI to come up" >> /tmp/kudeadminit.out
echo "Your worker nodes can join this master by running the following command as root" >> /tmp/kudeadminit.out
awk '/kubeadm join/' /tmp/kudeadminit.out >> /tmp/kudeadminit.out

