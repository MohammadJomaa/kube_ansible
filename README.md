# kube_ansible
Our enviroment
Redhat 8.1
Python-3.9.6
pip-22.2.2


#install ansible
python3 -m pip install --user ansible

Please make sure to have two node one for ansible controler and another for run kubernetes. and if you need to run on the same machine please use ssh connection on the same server.

Open Hosts file and change to your hostname
vi hosts


Vi Setup.yaml

name: K8s
  hosts: master
  #remote_user: azureuser
  become: yes
  become_method: sudo
  #gather_facts: no
  vars:
    ansible_ssh_private_key_file: ~/.ssh/azureuser       
    k8s_version: "1.24"     # Kubernetes version to be installed
    
    user: azureuser  
    #the same user that we made ssh connection for istio
    
Check  hots: master

Check ansible_ssh_private_key_file: ~/.ssh/azureuser  

check :
user: azureuser  
    #the same user that we made ssh connection for istio
    
    
    
    ansible-playbook -i hosts Setup.yml -vv 
    


