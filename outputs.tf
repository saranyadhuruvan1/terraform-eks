output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "nodegroup_name" {
  value = module.eks.nodegroup_name
}
