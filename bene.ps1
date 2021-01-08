
Connect-AzAccount
Get-AzSubscription
$startDate = "2020-12-01"
$EndDate = "2020-12-31"
$filename = '.\HybridBenefit.csv'
Add-Content -Path $filename -Value 'Subscription, VM Name, VM Type, Publisher, Offer, SKU, Image Reference, License Type, Status, Cost'
foreach ($Subscription in $(Get-AzSubscription| Where-Object {$_.State -ne "Disabled"}))
{
    Select-AzSubscription -SubscriptionId $Subscription.SubscriptionId
    $vms = (Get-AzVM)
    forEach ($vm in ($vms | Where-Object {$_.StorageProfile.OsDisk.OsType -EQ "Windows"})) 
        {
            $vminfos=(Get-AzVM -ResourceGroupName $vm.ResourceGroupName-Name $vm.Name -Status)
            $costTotal=0
            $Consumption=Get-AzConsumptionUsageDetail -StartDate $startDate  -EndDate $EndDate -InstanceName $vm.Name
            $Costs = $Consumption.PretaxCost
             foreach ($Cost in $Costs) { $CostTotal += $Cost}
            $text=$Subscription.Name + "," + $vm.name  + "," + $vm.StorageProfile.OsDisk.OsType + "," + $vm.StorageProfile.ImageReference.Publisher + "," + $vm.StorageProfile.ImageReference.Offer + "," + $vm.StorageProfile.ImageReference.Sku + "," + $vm.StorageProfile.ImageReference.Id + "," + $vm.LicenseType + "," + $vminfos.Statuses[1].Code + "," + $CostTotal
            Add-Content -Path $filename -Value $text
        }
    Write-Host "Subscription completed"
}