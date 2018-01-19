########################################################
##
## pip-facade-ecommerce-ps.ps1
## Client facade to ecommerce Pip.Services
## Powershell module entry
##
#######################################################

$path = $PSScriptRoot
if ($path -eq "") { $path = "." }

. "$($path)/src/clients/CreditCards.ps1"
