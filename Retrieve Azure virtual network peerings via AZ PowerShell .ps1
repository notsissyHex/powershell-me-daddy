## retrieve Azure virtual network peerings via AZ PowerShell module to help find overlaps

Get-AzVirtualNetwork |ForEach-Object { $vnet = $_; Get-AzVirtualNetworkPeering -VirtualNetworkName $_.Name -ResourceGroupName $_.ResourceGroupName | select @{n='ResourceGroup';e={$vnet.ResourceGroupName}},Name,VirtualNetworkName,@{n='AddressPrefixes';e={$vnet.AddressSpace.AddressPrefixes}},@{n='Subnets';e={$vnet.Subnets|Select -expand AddressPrefix}},@{n='PeeringTo';e={$_.RemoteVirtualNetworkAddressSpace | Select -expand AddressPrefixes }} }| sort-object -Property PeeringTo | format-table -auto