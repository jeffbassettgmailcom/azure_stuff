Checks all the subscriptions the login account has access to in order to confirm Azure Hybrid Benefit/Multitenant Hosting Rights are setup correctly (output to CSV). Also includes state of each VM (Powered On, Deallocated) and cost for a set period.

Output is a CSV in the format "Subscription, VM Name, VM Type, Publisher, Offer, SKU, Image Reference, License Type, Status, Cost"

-Multitenant Hosting Rights for Windows 10 have a .LicenseType of "Windows_Client"
-Azure Hybrid Benefit enabled Windows Servers have a .LicenseType of "Windows_Server"

Execution Policy might need to be changed to run Powershell scripts:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
