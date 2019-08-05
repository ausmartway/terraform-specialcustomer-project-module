module "gitbucket_repo_module" {
  source  = "app.terraform.io/SpecialCustomer/gitbucket-repo-module/specialcustomer"
  version = "1.3.9"
  reponame = "${var.projectname}"
}

module "tfe_workspace_module" {
  source  = "app.terraform.io/SpecialCustomer/tfe-workspace-module/specialcustomer"
  version = "0.2.1"

  enable_aws = var.enable_aws
  enable_azure = var.enable_azure
  enable_gcp = var.enable_gcp
  vcs_repoidentifier = "${module.gitbucket_repo_module.repoidentifier}"
  workspacename = "${var.projectname}-ws"
}