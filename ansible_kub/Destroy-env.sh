
sudo kubeadm reset --force
sudo rm -rf  $HOME/.kube/
sudo rm -rf /etc/cni/
sudo yum remove kubectl.x86_64 kubeadm.x86_64 kubelet.x86_64 -y 
sudo yum remove crio -y 
sudo yum remove crun -y 
sudo rm /etc/yum.repos.d/crio.repo /etc/yum.repos.d/kubernetes.repo
sudo rm -rf ~/istio*
 sudo rm -rf /var/run/crio/
  sudo rm -rf /var/run/crun/