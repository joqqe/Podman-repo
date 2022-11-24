function finish {
    Write-Host
    Write-Host -ForegroundColor Magenta  "Installation finished"
    Write-Host
    Pause
}

function menu {
    [string]$Title = 'Podman Menu'
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host
    Write-Host "1: Install SQLServer (SA:yourStrong(!)Password)"
    Write-Host
    Write-Host -ForegroundColor Magenta "0: Quit"
    Write-Host
    
    $actions = "0"
    while ($actions -notin "0..1") {
    $actions = Read-Host -Prompt 'What you want to do?'
        if ($actions -in 0..1) {
            if ($actions -eq 0) {
                exit
            }
            if ($actions -eq 1) {
                podman run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest
                Write-Host -ForegroundColor Magenta  "ConnectionString | Server=127.0.0.1,1433;Password=yourStrong(!)Password;User Id=SA;Initial Catalog={database-name};"
				finish
            }
            menu
        }
        else {
            menu
        }
    }
}
menu