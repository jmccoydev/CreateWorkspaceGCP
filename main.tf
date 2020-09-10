provider "tfe" {
  token = var.token
}

resource "tfe_workspace" "main" {
  name              = var.workspace_name
  organization      = var.organization
  auto_apply        = "true"
  queue_all_runs    = "true"
  terraform_version = "0.12.3"
}

resource "tfe_variable" "tfvars_sensitive" {
  count        = length(var.tfe_vars_sensitive)
  key          = element(keys(var.tfe_vars_sensitive), count.index)
  value        = element(values(var.tfe_vars_sensitive), count.index)
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "env_vars_sensitive" {
  count        = length(var.env_vars_sensitive)
  key          = element(keys(var.env_vars_sensitive), count.index)
  value        = element(values(var.env_vars_sensitive), count.index)
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "tfvars_sensitive" {
  count        = length(var.tfe_vars_nonsensitive)
  key          = element(keys(var.tfe_vars_nonsensitive), count.index)
  value        = element(values(var.tfe_vars_nonsensitive), count.index)
  category     = "terraform"
  sensitive    = false
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "env_vars_nonsensitive" {
  count        = length(var.env_vars_nonsensitive)
  key          = element(keys(var.env_vars_nonsensitive), count.index)
  value        = element(values(var.env_vars_nonsensitive), count.index)
  category     = "env"
  sensitive    = false
  workspace_id = tfe_workspace.main.id
}
