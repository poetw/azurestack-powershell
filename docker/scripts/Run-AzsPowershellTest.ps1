# Copyright (c) Microsoft Corporation. All rights reserved.

<#
.SYNOPSIS
    Runs the scripts used to run Test-AzsPowershell.ps1 in the order:
    1. Login-Environment.ps1
    2. New-AzsTestResources.ps1
    3. Test-AzsPowershell.ps1
#>
[CmdletBinding(DefaultParameterSetName='UserCredential')]
param
(
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string] $Name = 'AzureStack',

    [Parameter(Mandatory=$true)]
    [ValidateNotNull()]
    [ValidateScript({ $_.Scheme -eq [System.Uri]::UriSchemeHttps })]
    [System.Uri] $ResourceManagerEndpoint,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string] $DirectoryTenantId,

    [Parameter(Mandatory=$true, ParameterSetName='ClientSecret')]
    [ValidateNotNullOrEmpty()]
    [string] $ClientID,

    [Parameter(Mandatory=$true, ParameterSetName='ClientSecret')]
    [ValidateNotNullOrEmpty()]
    [String] $ClientSecret,

    [Parameter(Mandatory=$true, ParameterSetName='ClientCertificate')]
    [ValidateNotNullOrEmpty()]
    [string] $ApplicationId,

    [Parameter(Mandatory=$true, ParameterSetName='ClientCertificate')]
    [ValidateNotNullOrEmpty()]
    [ValidatePattern('^([0-9A-Fa-f]{2})*$')]
    [string] $CertificateThumbprint,

    # Optional subscription to select as the active / default subscription.
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string] $SubscriptionId,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string] $Location,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string] $ClientObjectId
)

$loginParameters = @{
    Name = $Name
    ResourceManagerEndpoint = $ResourceManagerEndpoint
    DirectoryTenantId = $DirectoryTenantId
    ClientID = $ClientID
    ClientSecret = $ClientSecret
    ApplicationId = $ApplicationId 
    CertificateThumbprint = $CertificateThumbprint 
    SubscriptionId = $SubscriptionId
}

if (-not $SubscriptionId)
{
    $loginParameters.Remove("SubscriptionId")
}

if ($ClientID)
{
    $loginParameters.Remove("ApplicationId")
    $loginParameters.Remove("CertificateThumbprint")
}
else
{
    $loginParameters.Remove("ClientID")
    $loginParameters.Remove("ClientSecret")
}

& "${PSScriptRoot}/Login-Environment.ps1" @loginParameters
& "${PSScriptRoot}/New-AzsTestResources.ps1" -Location $Location
& "${PSScriptRoot}/Test-AzsPowershell.ps1" -ClientObjectId $ClientObjectId