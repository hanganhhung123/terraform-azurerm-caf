terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
}
locals {
  tags = var.base_tags ? merge(
    var.global_settings.tags,
    try(var.resource_group.tags, null),
    try(var.settings.tags, null)
    ) : merge(
    try(var.settings.tags,
    null)
  )

  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
}
