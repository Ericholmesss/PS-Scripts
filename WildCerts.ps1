#Script for fetching all sites and their bindings

#First we want to make sure we have the Web Administration Server commandlet available

Import-Module -Name 'WebAdministration'

#Now we define our variable that we want to output. In this case we are looking for all sites that have a particular cert binding

$CertBinds = $null
$CertBinds = Get-Webbinding | Select-Object -Property bindingInformation | Select-String -Pattern "\*.reyqa.com"

#Now we want to use an if/else statement to send a clear message if the value is not found on the server we are looking at

if ($null -ne $CertBinds)
{$CertBinds | Out-File -FilePath C:\Temp\WildcardCertBinds.txt}
else 
{Write-Output "No wildcards certs found." | Out-File -FilePath C:\Temp\NoCerts.txt}

