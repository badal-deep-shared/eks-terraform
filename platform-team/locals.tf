locals {

  name            = "eks-blueprints"
  region          = data.aws_region.current.name
  cluster_version = "1.23"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  node_group_name = "managed-ondemand"

  #---------------------------------------------------------------
  # ARGOCD ADD-ON APPLICATION
  #---------------------------------------------------------------

  addon_application = {
    path               = "chart"
    repo_url           = "https://github.com/badal-deep-shared/eks-blueprints-add-ons.git"
    add_on_application = true
  }

  #---------------------------------------------------------------
  # ARGOCD WORKLOAD APPLICATION
  #---------------------------------------------------------------

  workload_application = {
    path               = "charts"
    repo_url           = "https://github.com/badal-deep-shared/eks-blueprints-workloads.git"
    add_on_application = false
  }

  tags = {
    Blueprint  = local.name
    GithubRepo = "github.com/badal-deep-shared/terraform-aws-eks-blueprints"
  }
}
