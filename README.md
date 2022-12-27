
![](https://img.shields.io/badge/Add%20Iterations%20To%20Azure%20DevOps-BuildStatus-informational)
[![Build Status](https://littlecoding.visualstudio.com/Open-Project/_apis/build/status/kunduso.add-iterations-to-azure-devops-project?branchName=main)](https://littlecoding.visualstudio.com/Open-Project/_build/latest?definitionId=36&branchName=main)<br />

![Image](https://skdevops.files.wordpress.com/2021/12/60-image-1.png)
## Motivation
The last two weeks of December are when I start planning for the following year. I use Azure DevOps to track my work -break down goals into features, features into user stories, which I map into sprints. Creating iterations and adding them to projects is something that anyone can automate.
<br />I have supporting documentation on my note at: [create-azure-devops-iterations-using-powershell](https://skundunotes.com/2021/12/26/create-azure-devops-iterations-using-powershell/)
## Prerequisites
It is necessary to have an Azure DevOps organization, a project to host the iterations, and admin credentials of the project to generate PAT.
## Usage
Step 1: Install Azure DevOps CLI
<br />Step 2: Create Azure DevOps PAT
<br />Step 3: Identify the start date, number of days in each iteration, and number of iterations to create and add to the team
<br />Step 4: Create and add iterations to the team
<br />Step 5: Review iteration and revoke PAT
