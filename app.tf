terraform {
  required_version = ">= 0.13"
  required_providers {
    kubectl = {
        source  = "gavinbunney/kubectl"
        version = "1.14.0"
    }
  }
}
provider "kubectl" {
  config_path = "~/.kube/kind-config-mycluster"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/kind-config-mycluster"
  }
}

# data "template_file" "app_yaml" {
#   template = file("${path.module}/app-dep.yaml")  
# }

#Provision the deployment manifest
resource "kubectl_manifest" "my_app" {
  yaml_body = file("${path.module}/app-dep.yaml")
}

#Provisions kube-prometheus stack
resource "helm_release" "kube_prom" {
  name       = "kube-prometheus-stack"
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  set {
    name  = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
    value = "false"
  }
}

# ServiceMonitor resources for scraping metrics
resource "kubectl_manifest" "service_monitor" {
  yaml_body = file("${path.module}/servicemonitor.yaml")
  depends_on = [
    kubectl_manifest.my_app
  ]
}

