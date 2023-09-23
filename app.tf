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
  config_path = "~/.kube/config-kind"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config-kind"
  }
}

data "template_file" "app_yaml" {
  template = file("${path.module}/app-dep.yaml")  
}

#Provision the deployment manifest
resource "kubectl_manifest" "my_app" {
  yaml_body = data.template_file.app_yaml.rendered
}

#Provisions kube-prometheus stack
resource "helm_release" "ingress" {
  name       = "kube-prometheus"
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
}