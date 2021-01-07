
Connect-AzAccount
Get-AzSubscription
#$vms | ?{$_.LicenseType -like "Windows_Server"} | select ResourceGroupName, Name, LicenseType

$filename='.\HybridBenefit.csv'
Add-Content -Path $filename -Value 'Subscription, VM Name, VM Type, Publisher, Offer, SKU, License Type'
foreach ($Subscription in $(Get-AzSubscription| Where-Object {$_.State -ne "Disabled"}))
{
    Select-AzSubscription -SubscriptionId $Subscription.SubscriptionId
    $vms = Get-AzVM
    forEach ($vm in ($vms | Where-Object {$_.StorageProfile.OsDisk.OsType -EQ "Windows"})) 
        {
            $text=$Subscription.Name + "," + $vm.name  + "," + $vm.StorageProfile.OsDisk.OsType + "," + $vm.StorageProfile.ImageReference.Publisher + "," + $vm.StorageProfile.ImageReference.Offer + "," + $vm.StorageProfile.ImageReference.Sku + "," + $vm.LicenseType
            Add-Content -Path $filename -Value $text
        }
    Write-Host "Subscription completed"
}