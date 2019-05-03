kubectl delete -f kube-logging.yaml
#create nfs Provisioner
kubectl delete -f nfs-client.yaml
kubectl delete -f nfs-client-sa.yaml
kubectl delete -f nfs-client-class.yaml
#
kubectl delete -f elasticsearch_svc.yaml
kubectl delete -f elasticsearch_statefulset.yaml
kubectl get sts -n kube-logging
kubectl get pods -n kube-logging
kubectl get svc -n kube-logging
#kibana
kubectl delete -f kibana.yaml
#fluentd
kubectl delete -f fluentd.yaml
kubectl get pods -n kube-logging
kubectl get ds -n kube-logging
