## Assume already connected to vCenter/ESXi via Connect-VIServer

## Change VM name, datastore, resource pool and network as required

1..100 |%{ $vmname = "GLDUMCLDCTX$($_.ToString().PadLeft( 3 , '0' ))" ; $vmname ; $vm = New-VM -Name $vmname -Datastore "Ortial 1TB" -NumCpu 2 -MemoryGB 1 -ResourcePool Resources -Location Dummies -DiskStorageFormat Thin -DiskGB 1 -NetworkName "Internal Network" }