# learn-terraform-azure

## Key Commands

`terraform init`:
- Initialises terraform in my repository, so i can use other terraform commands
- Only needs to be run once in a workspace
- Checks against providers given in the configuration and gets the provider versions

`terraform fmt`:
- Checks .tf files for formatting and will make fixes to incorrect formatting

`terraform plan`:
- Gets an execution plan to work out what actions need to be taken to turn the current state into the desired state
- Will show the plan that will be applied
- Will ask for verification
- Any errors will be highlighted
- Can save the plan with the `-out` argument

`terraform apply`:
- Applies the plan after prompt for approval
- Can skip the approval with `-auto-approve`
- If the plan is not saved, the plan is created again

`terraform show`:
- Provides a human readable view of the tfstate file, which is a JSON declarative file of the resources

`terraform refresh`:
- Updates the state file to reflect infrastructure changes done outside of terraform
- Not ideal, better to manage everything in terraform

## Files

### main.tf

Contains the resources and modules to be provisioned:
- Provider section
- Data source section to reference existing resources
- Resource section to define resources

They are of format:
<pre>
resource "type" "local_name" {
    param1 = "value1"
    param2 = "value2"
}
</pre>

### output.tf

Contains values to print on running `terraform apply` - particularly useful to get IDs that are known on apply

<pre>
output "output_name" {
    value   = "value"
}
</pre>

Can use local references or "${}" to get values

### variables.tf

Contain variables that can be used in plans, with defaults

To use the variables in a plan, use `-var 'var_name=var_value'`

This enables the separation of variables to use across environments

<pre>
variable "var_name" {
    description = ""
    type        = string, etc.
    default     = "default"
}
</pre>

### terraform.tfstate

Terraform maintains the state of the resources in the tfstate file (and the tfstate.backup file), as well as metadata

This provides the mapping from the current state to the desired state

This means that manual changes to resources in the Azure portal won't be picked up in the tfstate file

This file should not be edited manually

Remote state can assist with tracking the state across multiple developers