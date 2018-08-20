<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.

Code generated by Microsoft (R) PSSwagger
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
    Holds quota information used to control resource allocation.

.DESCRIPTION
    Holds quota information used to control resource allocation.

.PARAMETER AvailabilitySetCount
    Number of availability sets allowed.

.PARAMETER Id
    ID of the resource.

.PARAMETER Type
    Type of Resource.

.PARAMETER CoresLimit
    Number of cores allowed.

.PARAMETER VmScaleSetCount
    Number of scale sets allowed.

.PARAMETER MaxAllocationStandardManagedDisksAndSnapshots
    Number of Standard Managed Disks and Snapshots allowed.

.PARAMETER MaxAllocationPremiumManagedDisksAndSnapshots
    Number of Premium Managed Disks and Snapshots allowed.

.PARAMETER Name
    Name of the resource.

.PARAMETER VirtualMachineCount
    Number of virtual machines allowed.

.PARAMETER Location
    Location of the resource.

#>
function New-QuotaObject
{
    param(
        [Parameter(Mandatory = $false)]
        [int32]
        $AvailabilitySetCount,

        [Parameter(Mandatory = $false)]
        [string]
        $Id,

        [Parameter(Mandatory = $false)]
        [string]
        $Type,

        [Parameter(Mandatory = $false)]
        [int32]
        $CoresLimit,

        [Parameter(Mandatory = $false)]
        [int32]
        $VmScaleSetCount,

        [Parameter(Mandatory = $false)]
        [int32]
		$MaxAllocationStandardManagedDisksAndSnapshots,

        [Parameter(Mandatory = $false)]
        [int32]
		$MaxAllocationPremiumManagedDisksAndSnapshots,

        [Parameter(Mandatory = $false)]
        [string]
        $Name,

        [Parameter(Mandatory = $false)]
        [int32]
        $VirtualMachineCount,

        [Parameter(Mandatory = $false)]
        [string]
        $Location
    )

    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Compute.Admin.Models.Quota

    $PSBoundParameters.GetEnumerator() | ForEach-Object {
        if(Get-Member -InputObject $Object -Name $_.Key -MemberType Property)
        {
            $Object.$($_.Key) = $_.Value
        }
    }

    if(Get-Member -InputObject $Object -Name Validate -MemberType Method)
    {
        $Object.Validate()
    }

    return $Object
}
