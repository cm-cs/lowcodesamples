# Low / no code automation repository

## Introduction

This repository serves as the home to the Low / no-code automation project and continuous development thereafter.

## Getting Started

### Finding your way around this workspace

A vscode workspace file has been generated, along with vsocde tasks, giving strong hints that the IDE of choice is vscode!

src contains all the exported assets.
support contains supporting scripts and files, such as app manifests for slack.

## Build and Test

Create a supporting export-parameters JSON configuration file within your project area and add a vscode task to export (use the Export Logic Apps (example) task as an example - updating the path to your app). Run the export and generate supporting Terraform to build.

## Contribute

Contributing to this workspace is straightforward. Simply create a branch from your desired place, then, if you are simply contributing a new set of resources (e.g., Logic Apps), create a new area under src to house your assets, then follow the build and test steps above.

Once tested, raise a pull request to merge the changes back into the respective branch.

## Supporting tools

- [Visual Studio Code](https://https://code.visualstudio.com/download)
- [Azure Data Studio](https://learn.microsoft.com/en-gb/sql/azure-data-studio/download-azure-data-studio#download-azure-data-studio)

## Deploy

At your own risk:

[![Deploy Samples To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcm-cs%2Flowcodesamples%2Fmain%2Fsrc%2F_examples%2Farm-templates%2FazureDeploy.json)

- Deploy to Azure
- Grant -notify MI required KeyVault secrets user role
- Create the two required secrets
