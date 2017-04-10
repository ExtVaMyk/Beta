Set-ExecutionPolicy unrestricted

import-module "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
import-module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1"
import-module sqlps

$MyNAVServerName = "ForNAV" 
$MySQLServerName = ".\NAVDEMO" 
$MyNewCustomerName = "NewCustomer" 
$MyNewDatabaseName = "ForNAV" 
$DBServer = ".\NAVDEMO"
$SQLPath = "C:\Program Files\Microsoft SQL Server\MSSQL12.NAVDEMO\MSSQL\Backup\"


$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\80\RoleTailored Client\finsql.exe" 

invoke-sqlcmd -ServerInstance $MySQLServerName -U "powershell" -P "test" -Query "ALTER DATABASE [ForNAV] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE" 
invoke-sqlcmd -ServerInstance $MySQLServerName -U "powershell" -P "test" -Query "DROP DATABASE [ForNAV]"

invoke-sqlcmd -ServerInstance $MySQLServerName -Query ("RESTORE DATABASE [ForNAV] FROM  DISK = N'" + $SQLPath + "Demo Database NAV (10-0).bak' WITH  FILE = 1,  MOVE N'Demo Database NAV (10-0)_Data' TO N'" `
                                                                                                   + $SQLPath + "\" + $MyNewDatabaseName + " (10-0)_Data.mdf',  MOVE N'Demo Database NAV (10-0)_Log' TO N'" `
                                                                                                   + $SQLPath + "\" + $MyNewDatabaseName + " (10-0)_Log.ldf',  NOUNLOAD,  STATS = 5")
