
# K8s Cluster with Kind, Node.js Application Deployment, and Monitoring Setup

A brief description of what this project does and who it's for


## Prerequisites

- Docker
- kubectl
- Terraform
- Kind
- Helm 
## Accessing the Application
After deployment, we can access the application by forwarding the port:
```bash
kubectl port-forward svc/hello-world-svc 8080:8000

```

## Accessing Prometheus and Grafana
For Prometheus
```bash
kubectl port-forward svc/kube-prometheus-stack-prometheus 9090
```                 

For Grafana
```bash
kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 

```  

![](./prometheus.PNG)

![](./grafana.PNG)

