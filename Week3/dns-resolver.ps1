param(
    [Parameter(Mandatory=$true)]
    [string]$Subnet,

    [Parameter(Mandatory=$true)]
    [string]$DnsServerAddress
)

1..254 | ForEach-Object {
    $FullIP = "${Subnet}.$_"
    
    try {
        $dnsLookup = Resolve-DnsName -DnsOnly $FullIP -Server $DnsServerAddress -ErrorAction Ignore
        if ($dnsLookup) {
            Write-Output $dnsLookup
        }
    } catch {
        Write-Error $_.Exception.Message
    }
}
