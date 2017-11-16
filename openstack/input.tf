# General cluster settings
variable "name" { default = "openstack" }
variable "data_dir" { default = "/cncf/data/openstack" }

# TLS settings
variable "cloud_location" { default = "vexxhost.com" }

# Bastion Configuration
variable "bastion_flavor_name" { default = "v1-standard-1" }
variable "bastion_image_name" { default = "CoreOS 1298.6.0 (MoreOS) [2017-03-15]" }
variable "bastion_floating_ip_pool" { default = "public" }

# Master Configuration
variable "master_flavor_name" { default = "v1-standard-1" }
variable "master_image_name" { default = "CoreOS 1298.6.0 (MoreOS) [2017-03-15]" }
variable "master_node_count" { default = "3" }

# Worker Configuration
variable "worker_flavor_name" { default = "v1-standard-1" }
variable "worker_image_name"  { default = "CoreOS 1298.6.0 (MoreOS) [2017-03-15]" }
variable "worker_node_count" { default = "3" }

# Network resources
variable "external_network_id" { default = "6d6357ac-0f70-4afa-8bd7-c274cc4ea235" }
variable "internal_network_cidr" { default = "10.240.0.0/16" }
variable "internal_lb_ip" { default = "10.240.0.101" }

# Kubernetes configuration
variable "etcd_endpoint" {default = "127.0.0.1"}
variable "cloud_provider" { default = "openstack" }
#   I'm not so sure about this one
variable "cloud_config" { default = "--cloud-config=/etc/srv/kubernetes/cloud-config" }
variable "cluster_domain" { default = "cluster.local" }
variable "cluster_name" { default = "kubernetes" }
variable "pod_cidr" { default = "100.96.0.0/11" }
variable "service_cidr"   { default = "100.64.0.0/13" }
variable "non_masquerade_cidr" { default = "100.64.0.0/10"}
variable "dns_service_ip" { default = "100.64.0.10" }

# Deployment Artifact Versions
variable "kubelet_artifact" { default = "https://storage.googleapis.com/kubernetes-release/release/v1.8.1/bin/linux/amd64/kubelet" }
variable "cni_artifact" { default = "https://github.com/containernetworking/cni/releases/download/v0.5.2/cni-amd64-v0.5.2.tgz" }

variable "etcd_image" { default = "gcr.io/google_containers/etcd"}
variable "etcd_tag" { default = "2.2.1"}
variable "kube_apiserver_image" { default = "gcr.io/google_containers/kube-apiserver"}
variable "kube_apiserver_tag"   { default = "v1.8.1"}
variable "kube_controller_manager_image" { default = "gcr.io/google_containers/kube-controller-manager"}
variable "kube_controller_manager_tag" { default = "v1.8.1"}
variable "kube_scheduler_image" { default = "gcr.io/google_containers/kube-scheduler"}
variable "kube_scheduler_tag" { default = "v1.8.1"}
variable "kube_proxy_image" { default = "gcr.io/google_containers/kube-proxy"}
variable "kube_proxy_tag" { default = "v1.8.1"}

