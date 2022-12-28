[![](https://img.shields.io/badge/Add%20Iterations%20To%20Azure%20DevOps-BuildStatus-informational)](./)
[![Build Status](https://littlecoding.visualstudio.com/Open-Project/_apis/build/status/kunduso.add-iterations-to-azure-devops-project?branchName=main)](https://littlecoding.visualstudio.com/Open-Project/_build/latest?definitionId=36&branchName=main)<br />

![Image](https://skdevops.files.wordpress.com/2021/12/60-image-1.png)
## Motivation
Each year the last two weeks of December are when I start planning for the following year. I use Azure DevOps to track my work -break down goals into features, features into user stories, which I map into sprints. Creating iterations and adding them to projects is something that anyone can automate.

<br />**UPDATE:**
<br />In Dec-2022, I automated the script using Azure DevOps pipeline. If you are interested in [using Azure DevOps build pipeline.](#using-azure-devops-build-pipeline)

## **Running the PowerShell script from your local?**
## Prerequisites
It is necessary to have an Azure DevOps organization, a project to host the iterations, and admin credentials of the project to generate PAT.
## Usage
Step 1: Install [Azure DevOps CLI](https://github.com/Azure/azure-devops-cli-extension) on your local system/laptop.
<br />Step 2: Create [Azure DevOps PAT](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows#create-a-pat) in your Azure DevOps organization.
<br />Step 3: Identify the start date, number of days in each iteration, and number of iterations to create and add to the team.
<br />*Note: I start my sprints on Saturday and they are for 2 weeks long. I create sprints for the full year (hence 26 sprints) starting from the first Saturday of January. Therefore in 2023 the first day of the first sprint is 7th January 2023.*
<br />Step 4: Run the script from your local
<br />`createIterations.ps1 -Organization "$(Organization)" -PAT "$(PAT)" -Project "$(Project)" -TeamName "$(TeamName)" -YearOfIteration "$(YearOfIteration)" -MonthOfIteration "$(MonthOfIteration)" -StartDateOfIteration "$(StartDateOfIteration)" -NumberOfSprints "$(NumberOfSprints)"`
<br />To ceate 26 sprints starting on 7th of January 2023 the argument list would look like below:
<br />`createIterations.ps1 -Organization "$(Organization)" -PAT "$(PAT)" -Project "$(Project)" -TeamName "$(TeamName)" -YearOfIteration "2023" -MonthOfIteration "1" -StartDateOfIteration "7" -NumberOfSprints "26"`
<br />where `$(Organization)="https://dev.azure.com/$(your-organization-name)/"`
`$(Project)="$(your-project-name)" $(TeamName) = "$(your-team-name)"` and I have already listed the step to create the PAT above.
<br />Step 5: Review iterations and [revoke PAT](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows#revoke-a-pat)

<br />I have supporting documentation of the legacy process (running the PowerShell script from your local) on my note at: [create-azure-devops-iterations-using-powershell](https://skundunotes.com/2021/12/26/create-azure-devops-iterations-using-powershell/)
## **Using Azure DevOps build pipeline?**
## Prerequisites
It is necessary to have an Azure DevOps organization, a project to host the iterations, and admin credentials of the project to generate PAT.
## Usage
Step 1: Create [Azure DevOps PAT](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows#create-a-pat)
<br />Step 2: Create a variable group to store the required variables
<br />Step 3: Create a pipeline in Azure DevOps
<br />Step 4: Run the pipeline in Azure DevOps
<br />Step 5: Review iterations and [revoke PAT](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows#revoke-a-pat)