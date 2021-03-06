$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)

$TestRecordingFile = Join-Path $PSScriptRoot 'DelegatedProviderManagedOffer.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'DelegatedProviderManagedOffer' {

    . $PSScriptRoot\Common.ps1

    BeforeEach {

        function ValidateDelegatedProviderOffer {
            param(
                [Parameter(Mandatory = $true)]
                $offer
            )
            # Overall
            $offer            | Should Not Be $null
            # Resource
            $offer.Id         | Should Not Be $null
            $offer.Location   | Should Not Be $null
            $offer.Name       | Should Not Be $null
            $offer.Type       | Should Not Be $null
        }
    }

    AfterEach {
        $global:Client = $null
    }

    it "TestListDelegatedProviderOffers" -Skip:$('TestListDelegatedProviderOffers' -in $global:SkippedTests) {
        $global:TestName = 'TestListDelegatedProviderOffers'

        $providers = Get-AzsDelegatedProvider

        foreach ($provider in $providers) {
            $offers = Get-AzsDelegatedProviderManagedOffer -DelegatedProviderSubscriptionId $provider.DelegatedProviderSubscriptionId
            foreach ($offer in $offers) {
                ValidateDelegatedProviderOffer $offer
            }
        }
    }

}
