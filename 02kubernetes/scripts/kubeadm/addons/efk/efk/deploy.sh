kubectl apply -f kube-logging.yaml
#create nfs Provisioner
kubectl apply -f nfs-client.yaml
kubectl apply -f nfs-client-sa.yaml
kubectl apply -f nfs-client-class.yaml
#
kubectl apply -f elasticsearch_svc.yaml
kubectl apply -f elasticsearch_statefulset.yaml
kubectl get sts -n kube-logging
kubectl get pods -n kube-logging
kubectl get svc -n kube-logging
#kibana
kubectl apply -f kibana.yaml
#fluentd
kubectl apply -f fluentd.yaml
kubectl get pods -n kube-logging
kubectl get ds -n kube-logging

