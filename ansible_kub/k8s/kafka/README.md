
#link https://levelup.gitconnected.com/how-to-deploy-apache-kafka-with-kubernetes-9bd5caf7694f
#Make pthes for your data
mkdir <<Data_Path>>/data_kafka/
mkdir <<Data_Path>>/data_zookeeper/

 
#clone the repo
git clone https://github.com/MohammadJomaa/kube_ansible.git

cd kube_ansible/ansible_kub/k8s/kafka/
vi deploy-kafka.yaml
#Change   <<Data_Path>> with the desired path
# hostPath: <<Data_Path>>
#   path: "<<Data_Path>>/data_kafka/"  
    
#  hostPath:
#    path: "<<Data_Path>>/data_zookeeper/"  
    
kubectl apply -f deploy-kafka.yaml 
#in this file we created 
#1- namespace  --> kafka

#2- service  --> kafka-service

#3- service  --> zookeeper-service 

#4- Deployment --> kafka

#5- Deployment --> zookeeper

#6- PersistentVolumeClaim --> zookeeper-pvc 

#7- PersistentVolumeClaim --> kafka-pvc

#8- PersistentVolume --> kafka-pv

#9- PersistentVolume --> zookeeper-pvc 
  
sudo chmod -Rf 777 '{{ data_storage_path }}/data_zookeeper/'
sudo chmod -Rf 777 '{{ data_storage_path }}/data_kafka/'  
