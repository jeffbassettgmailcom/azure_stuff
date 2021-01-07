Checking all the subscriptions login account has access to in order to confirm Azure Hybrid Benefit/Multitenant Hosting Rights are setup correctly (output to CSV)

Multitenant Hosting Rights for Windows 10 have a .LicenseType of "Windows_Client"
Azure Hybrid Benefit enabled Windows Servers have a .LicenseType of "Windows_Server"

Execution Policy might need to be changed to run powershell scripts:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
