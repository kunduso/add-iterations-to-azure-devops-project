#//***Please update the values in below 5 lines before working with this code***
# $PAT ="enter-PAT-value"
# $Organization = "https://dev.azure.com/$(your-organization-name)/"
# $Project="$(your-project-name)"
# $TeamName = "$(your-team-name)"

param(
    [Parameter(Mandatory=$true)][String]$PAT,
    [Parameter(Mandatory=$true)][String]$Project,
    [Parameter(Mandatory=$true)][String]$TeamName,
    [Parameter(Mandatory=$true)][String]$Organization,
    [Parameter(Mandatory=$true)][String]$YearOfIteration,
    [Parameter(Mandatory=$true)][String]$FirstDateOfIteration
)
Write-Host "Value of Project: $Project"
Write-Host "Value of Team: $TeamName"
Write-Host "Value of Team: $Organization"
$NumberOfSprints = 26
#//auto setting variables based on values provided
$StartDate = Get-Date -Year $YearOfIteration -Month 1 -Day $FirstDateOfIteration
$RootPath = "\"+$Project+"\Iteration\"+$StartDate.Year
$ParentIteration = "\"+$Project+"\Iteration"

#//execution begins
Write-Output $PAT | az devops login --org $Organization
Write-Host '===Configuring connection to organization and Team Project'
az devops configure --defaults organization=$Organization project=$Project
$ListOfIterations = az boards iteration project list --depth 1 | ConvertFrom-Json

# foreach ($iteration in $ListOfIterations.children)
# {
#     # $createiteration = false
#     # if ($iteration.name -ne $StartDate.Year)
#     # {

#     # }
#     # if ($createiteration)
#     # {
#     #     $CreateRootIteration = az boards iteration project create --name $StartDate.Year --path $ParentIteration | ConvertFrom-Json
#     #     Write-Host 'Created Root path: '$CreateRootIteration.name
#     # }
# }
if ($ListOfIterations.children -contains $StartDate.Year)
{
    Write-Host 'Path exists'
}

#     $StartDateIteration = $StartDate
# For ($i=1; $i -le $NumberOfSprints; $i++) 
# {
#     $Sprint = '2023-iteration-' + $i
#     $FinishDateIteration = $StartDateIteration.AddDays(13)
#     $createIteration = az boards iteration project create --name $Sprint --path $RootPath --start-date $StartDateIteration --finish-date $FinishDateIteration --org $Organization --project $Project | ConvertFrom-Json
#     $addIteration = az boards iteration team add --id $createIteration.Identifier --team $TeamName --org $Organization --project $Project | ConvertFrom-Json
#     Write-Host $addIteration.name 'created on path'$addIteration.path
#     $StartDateIteration = $FinishDateIteration.AddDays(1)
# }
az devops logout