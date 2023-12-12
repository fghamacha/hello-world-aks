# Définir les variables
$resourceGroupName = "fghamacha-terraform-state-rg" # Le nom de groupe de ressources
$storageAccountName = "fghamachatfstatestorage" # Le nom de compte de stockage qui doit être unique dans le monde entier.
$location = "francecentral" # La région la plus proche de Paris
$containerName = "fghamacha-tfstate-container" # Le nom du conteneur blob


# Créer un groupe de ressources
az group create --name $resourceGroupName --location $location

# Créer un compte de stockage pour Terraform Remote State
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku Standard_LRS

# Récupérer la clé d'accès au compte de stockage (à des fins d'utilisation ultérieure dans Terraform)
$storageAccountKey = az storage account keys list --resource-group $resourceGroupName --account-name $storageAccountName --query "[0].value" -o tsv

# Créer un conteneur blob pour le stockage de l'état Terraform
az storage container create --name $containerName --account-name $storageAccountName --account-key $storageAccountKey

# Afficher les informations nécessaires pour Terraform
Write-Output "Ressources créées avec succès :"
Write-Output "Resource Group Name: $resourceGroupName"
Write-Output "Storage Account Name: $storageAccountName"
Write-Output "Storage Account Key: $storageAccountKey"
Write-Output "Location: $location"
Write-Output "Container Name: $containerName"
