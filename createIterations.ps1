#//***Please update the values in below 5 lines before working with this code***
# $PAT ="enter-PAT-value"
# $Organization = "https://dev.azure.com/$(your-organization-name)/"
# $Project="$(your-project-name)"
# $TeamName = "$(your-team-name)"
# $NumberOfSprints = 26

# delete this blog after testing
param(
    [Parameter(Mandatory=$true)][String]$PAT,
    [Parameter(Mandatory=$true)][String]$Project,
    [Parameter(Mandatory=$true)][String]$TeamName
)
Write-Host '===Configuring connection to organization and Team Project'
Write-Host "Value of PAT: $PAT"
Write-Host "Value of Project: $Project"
Write-Host "Value of Team: $TeamName"

#//auto setting variables based on values provided
# $StartDate = Get-Date -Year 2022 -Month 1 -Day 8
# $RootPath = "\"+$Project+"\Iteration\"+$StartDate.Year
# $ParentIteration = "\"+$Project+"\Iteration"

#//execution begins
# echo $PAT | az devops login --org $Organization
# Write-Host '===Configuring connection to organization and Team Project'
# az devops configure --defaults organization=$Organization project=$Project
# $CreateRootIteration = az boards iteration project create --name $StartDate.Year --path $ParentIteration | ConvertFrom-Json
# Write-Host 'Created Root path: '$CreateRootIteration.name
#     $StartDateIteration = $StartDate
# For ($i=1; $i -le $NumberOfSprints; $i++) 
# {
#     $Sprint = '2022-iteration-' + $i
#     $FinishDateIteration = $StartDateIteration.AddDays(13)
#     $createIteration = az boards iteration project create --name $Sprint --path $RootPath --start-date $StartDateIteration --finish-date $FinishDateIteration --org $Organization --project $Project | ConvertFrom-Json
#     $addIteration = az boards iteration team add --id $createIteration.Identifier --team $TeamName --org $Organization --project $Project | ConvertFrom-Json
#     Write-Host $addIteration.name 'created on path'$addIteration.path
#     $StartDateIteration = $FinishDateIteration.AddDays(1)
# }