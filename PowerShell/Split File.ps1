Set-ExecutionPolicy unrestricted

import-module "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
import-module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1"

Split-NAVApplicationObjectFile -Source "Q:\ForNAV\Add-On\Objects.txt" -Destination "Q:\ForNAV\Add-On\Objects\" -Force
