output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "nodegroup_name" {
  value = keys(module.eks.eks_managed_node_groups)[0]
}
