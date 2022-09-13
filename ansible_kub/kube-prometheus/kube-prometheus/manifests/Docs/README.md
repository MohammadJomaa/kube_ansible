#Deploy Prometheus and Grafana on Kubernetes using prometheus-operator
#Link https://github.com/prometheus-operator/kube-prometheus

#   ********* Prerequisites  ***************
#the kubelet configuration must contain these flags:
#--authentication-token-webhook=true
#--authorization-mode=Webhook




# Create the namespace and CRDs, and then wait for them to be available before creating the remaining resources
# Note that due to some CRD size we are using kubectl server-side apply feature which is generally available since kubernetes 1.22.
# If you are using previous kubernetes versions this feature may not be available and you would need to use kubectl create instead.

git clone https://github.com/prometheus-operator/kube-prometheus
cd kube-prometheus
kubectl apply --server-side -f manifests/setup
kubectl wait \
	--for condition=Established \
	--all CustomResourceDefinition \
	--namespace=monitoring
kubectl apply -f manifests/



#***************  Access UIs *************
#Prometheus, Grafana, and Alertmanager dashboards can be accessed quickly using kubectl port-forward after running 

#https://github.com/prometheus-operator/kube-prometheus/blob/main/docs/access-ui.md

#Prometheus
kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090
#Then access via http://localhost:9090
#Then access via http://localhost:9090/targets

#Grafana
kubectl --namespace monitoring port-forward svc/grafana 3000
#Then access via http://localhost:3000 and use the default grafana user:password of admin:admin.

#Alert Manager
kubectl --namespace monitoring port-forward svc/alertmanager-main 9093
#Then access via http://localhost:9093

#you can edit type of service

#Troubleshooting
#https://github.com/prometheus-operator/kube-prometheus/blob/main/docs/troubleshooting.md
