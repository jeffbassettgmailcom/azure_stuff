Connect-AzAccount
#$subs = 
Get-AzSubscription
#vms = Get-AzVM
#$vms | ?{$_.LicenseType -like "Windows_Server"} | select ResourceGroupName, Name, LicenseType

Get-AzSubscription -SubscriptionID 97552b17-4562-4277-93bf-38a5817a99ff| Set-AzContext
$vms = Get-AzVM
    forEach ($vm in $vms) {
        Write-Host $vm.Name
        Write-Host $vm.LicenseType
    }
    Write-Host "hello world"
    
    
    #CL-CT-SMO-NPRD ec8540e0-5da9-4bd4-93ae-805a5c50243e
    #CL-Corp-NPRD                                      97552b17-4562-4277-93bf-38a5817a99ff

    