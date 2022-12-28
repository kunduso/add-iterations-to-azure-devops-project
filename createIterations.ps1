param(
    [Parameter(Mandatory=$true)][String]$Organization,
    [Parameter(Mandatory=$true)][String]$PAT,
    [Parameter(Mandatory=$true)][String]$Project,
    [Parameter(Mandatory=$true)][String]$TeamName,
    [Parameter(Mandatory=$true)][String]$YearOfIteration,
    [Parameter(Mandatory=$true)][String]$MonthOfIteration,
    [Parameter(Mandatory=$true)][String]$StartDateOfIteration,
    [Parameter(Mandatory=$true)][String]$NumberOfSprints
)
Write-Host "`nValues provided to the script:"
#Write-Host "Organization: $Organization"
Write-Host "Project: $Project"
Write-Host "Team: $TeamName"
Write-Host "YearOfIteration: $YearOfIteration"
Write-Host "MonthOfIteration: $MonthOfIteration"
Write-Host "StartDateOfIteration: $StartDateOfIteration"
Write-Host "NumberOfSprints: $NumberOfSprints`n"

#auto setting variables based on values provided
$StartDate = Get-Date -Year $YearOfIteration -Month $MonthOfIteration -Day $StartDateOfIteration
$RootPath = "\"+$Project+"\Iteration\"+$StartDate.Year
$ParentIteration = "\"+$Project+"\Iteration"

#execution begins
Write-Output $PAT | az devops login --org $Organization
Write-Host "`n===Configuring connection to organization and Team Project==="
az devops configure --defaults organization=$Organization project=$Project
$ListOfIterations = az boards iteration project list --depth 1 | ConvertFrom-Json

# if the root folder exists, do not create it again.
if ($ListOfIterations.children.name -contains $StartDate.Year)
{
    Write-Host "`n$($StartDate.Year) path already exists and won't be created."
}
else {
    Write-Host "`n$($StartDate.Year) does not exist and will be created."
    $CreateRootIteration = az boards iteration project create --name $StartDate.Year --path $ParentIteration | ConvertFrom-Json
    Write-Host 'Created Root path: '$CreateRootIteration.name
    $StartDateIteration = $StartDate
    For ($i=1; $i -le $NumberOfSprints; $i++) 
    {
        $Sprint = "$($StartDate.Year)"+"-iteration-" + $i
        $FinishDateIteration = $StartDateIteration.AddDays(13)
        $createIteration = az boards iteration project create --name $Sprint --path $RootPath --start-date $StartDateIteration --finish-date $FinishDateIteration --org $Organization --project $Project | ConvertFrom-Json
        $addIteration = az boards iteration team add --id $createIteration.Identifier --team $TeamName --org $Organization --project $Project | ConvertFrom-Json
        Write-Host $addIteration.name 'created on path'$addIteration.path
        $StartDateIteration = $FinishDateIteration.AddDays(1)
    }
}

az devops logout