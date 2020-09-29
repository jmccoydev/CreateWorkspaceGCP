# THESE VALUES CAN BE MANAGED WITHIN THE WORKSPACE ITSELF
# The Values are unchanging in the 'Master' Workspace

#token = "Terraform Enterprise API token"

#organization = "hc-solutions-engineering"

#vcs_repo = "VCS/Repo"

#oauth_token_id = "oauth_token_id"


# The Values can be changed for use in the newly-created Workspace
# Additional values could be added here (ex. branch, etc.)

workspace_name = "name of workspace to create"


tfe_vars_sensitive = {
    foo = "bar"
}

env_vars_sensitive  = {
    Bob = "Alice"
}

tfe_vars_nonsensitive = {
    foo = "bar"
}

env_vars_nonsensitive  = {
    Bob = "Alice"
}
