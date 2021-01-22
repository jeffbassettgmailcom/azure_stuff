Connect-AzAccount
Get-AzSubscription
$filename = 'C:\temp\Blobs.csv'
Add-Content -Path $filename -Value 'Subscription, Resource Group, Storage Account, Containers, PublicAccess'
foreach ($Subscription in $(Get-AzSubscription| Where-Object {$_.State -ne "Disabled"}))
{
    Select-AzSubscription -SubscriptionId $Subscription.SubscriptionId
                    $sgs = (Get-AzStorageAccount)
                    foreach ($sg in ($sgs))
                    {
                        $storageAccount=Get-AzStorageAccount -ResourceGroupName $sg.ResourceGroupName -Name $sg.StorageAccountName
                        $ctx=$storageAccount.Context
                        $out=Get-AzStorageContainer -Context $ctx
                        $text = $Subscription.Name  + "," + $sg.ResourceGroupName + "," + $sg.StorageAccountName + "," + $out.Name+ "," + $out.PublicAccess
                        Add-Content -Path $filename -Value $text
                    }
    Write-Host "Subscription completed"
}