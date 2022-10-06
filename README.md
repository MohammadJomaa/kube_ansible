# kube_ansible
#Our enviroment
- Redhat 8.1
- Python-3.9.6
- pip-22.2.2

# Install Python
Source Link :
https://www.vultr.com/docs/update-python3-on-centos/

 1. Run the commands below:
 ```bash
 sudo yum groupinstall 'development tools' -y 
 sudo yum install wget openssl-devel bzip2-devel libffi-devel xz-devel -y
sudo wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
sudo tar xzf Python-3.9.6.tgz
cd Python-3.9.6 
sudo ./configure --enable-optimizations
sudo make altinstall
ls /usr/local/bin/python*
sudo alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 1 
sudo alternatives --set python3 /usr/local/bin/python3.9 
sudo echo "2" | sudo alternatives --config python

sudo /usr/local/bin/python3.9 -m pip install --upgrade pip
ls /usr/local/bin/pip*
sudo alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.9 1 
sudo alternatives --set pip /usr/local/bin/pip3.9
python -V && pip -V
```
 2. Install Ansible : `python3 -m pip install --user ansible`

# Run Ansible
Please make sure to have two node one for ansible controler and another for kubernetes, and if you need to run on the same machine please use ssh connection on the same server.

1. Open Hosts file and change to your hostname
`vi hosts`


 2. Edit Setup.yaml to map your hostname and user
`Vi Setup.yaml`

```yaml
name: K8s
  hosts: <yourhostname>
  #remote_user: azureuser
  become: yes
  become_method: sudo
  #gather_facts: no
  vars:
    ansible_ssh_private_key_file: ~/.ssh/azureuser       
    k8s_version: "1.24"     # Kubernetes version to be installed
    
    user: <youruser> 
    #the same user that we made ssh connection for istio
```

> Replace \<yourhostname> and     \<youruser>

3.  Run Ansible PlayBook 
` ansible-playbook -i hosts Setup.yml -vv `
    


