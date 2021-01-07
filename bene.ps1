Connect-AzAccount
Get-AzSubscription
#$vms | ?{$_.LicenseType -like "Windows_Server"} | select ResourceGroupName, Name, LicenseType

$filename='.\HybridBenefit.html'
foreach ($Subscription in $(Get-AzSubscription| Where-Object {$_.State -ne "Disabled"}))
{
    Select-AzSubscription -SubscriptionId $Subscription.SubscriptionId
    $vms = Get-AzVM
    $text = '<b>Subscription is ' 
    $text+= $Subscription.Name 
    $text+= '</b><br>'
    Add-Content -Path $filename -Value $text
    forEach ($vm in $vms) 
        {
            $text='VM Name is '
            $text+=$vm.LicenseType
            $text+= '<br>'
            Out-File -FilePath $filename -InputObject $text -Append
            $text='VM License is '
            $text+=$vm.LicenseType
            $text+= '<br>'
            Out-File -FilePath $filename -InputObject $text -Append
        }
    Write-Host "Subscription completed"
}