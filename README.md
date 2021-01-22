bene.ps1

What even is this:
Checks all the subscriptions the login account has access to in order to confirm Azure Hybrid Benefit/Multitenant Hosting Rights are setup correctly (output to CSV). Also includes state of each VM (Powered On, Deallocated) and cost for a set period.

Output is a CSV in the format "Subscription, VM Name, VM Type, Publisher, Offer, SKU, Image Reference, License Type, Status, Cost"

Multitenant Hosting Rights for Windows 10 have a .LicenseType of "Windows_Client"

Azure Hybrid Benefit enabled Windows Servers have a .LicenseType of "Windows_Server"

TBD:
Using the following we can also calculate how much of our hybrid benefit entitlement we're using (from https://azure.microsoft.com/en-us/pricing/hybrid-benefit/faq/):

"Each two-processor license or each set of 16-core licenses, either Datacenter or Standard editions, are entitled to two instances of up to 8 cores, or one instance of up to 16 cores. Datacenter edition licenses allow for simultaneous usage on-premises and in Azure. "

Random:
Execution Policy might need to be changed to run Powershell scripts:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

blobcheck.ps1

Checks all Azure storage blob containers to see if public access is turned on and writes to a csv.

Needs the "Storage Account Contributor" role to work.

