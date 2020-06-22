resource "azurerm_resource_group" "tf_az_challenge_1" {
  name     = "tfazchallenge1"
  location = "North Europe"
}

resource "azurerm_app_service_plan" "tf_az_challenge_1" {
  name                = "tfazchallenge1"
  location            = azurerm_resource_group.tf_az_challenge_1.location
  resource_group_name = azurerm_resource_group.tf_az_challenge_1.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "tf_az_challenge_1" {
  name                = "tfazchallenge1"
  location            = azurerm_resource_group.tf_az_challenge_1.location
  resource_group_name = azurerm_resource_group.tf_az_challenge_1.name
  app_service_plan_id = azurerm_app_service_plan.tf_az_challenge_1.id

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2",
    "ApiUrl" = "",
    "ApiUrlShoppingCart" = "",
    "MongoConnectionString" = "",
    "SqlConnectionString" = "",
    "productImagesUrl" = "https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail",
    "Personalizer__ApiKey" = "",
    "Personalizer__Endpoint" = ""
  }
}