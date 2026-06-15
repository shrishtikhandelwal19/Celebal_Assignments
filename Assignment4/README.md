# Assignment 4: Azure Data Factory Pipeline for Metadata Validation

## Assignment Title
Azure Data Factory Pipeline for Source-to-Destination Data Transfer with Metadata Validation

## Objective
Design and implement an Azure Data Factory pipeline that moves data from an Azure Blob Storage source container to a destination container while validating file metadata before execution.

## Azure Services Used
- Microsoft Azure
- Azure Blob Storage
- Azure Data Factory
- Azure Storage Account
- Azure Resource Group
- Azure Identity and Access Management (IAM)

## Architecture Overview
Azure Blob Storage → Azure Data Factory → Destination Container

- Source container stores inbound data files.
- Azure Data Factory orchestrates data movement and metadata validation.
- Destination container receives validated output data.

## IAM Roles and Access Configuration
- Assigned IAM roles to secure resources and limit privileges.
- Used **Reader** access for monitoring resources and metadata inspection.
- Used **Contributor** access for Data Factory, Storage Account, and pipeline deployment.
- Validated access through Azure Portal and linked service credential configuration.

## Implementation Steps
1. Create an Azure Resource Group to organize resources.
2. Provision an Azure Storage Account and create source and destination blob containers.
3. Create an Azure Data Factory instance.
4. Configure linked services for Azure Blob Storage and Data Factory.
5. Create datasets for the source container and destination container.
6. Build a pipeline using metadata validation and a copy activity.
7. Publish the pipeline and run a debug or trigger execution.


## Pipeline Execution Details
- Pipeline was executed in Azure Data Factory using the debug and trigger workflows.
- Monitoring was performed through the ADF Monitoring view.
- Execution details captured successful data movement and metadata validation results.
- Completed pipeline runs were validated against expected output and metadata checks.

## Screenshots Section
The following screenshot folders contain visual documentation of the implementation:
- `mini project screenshots/`
- `objective screesnhots/`
- `Task screenshots/`

Screenshots include:
- Resource group and storage account creation
- Linked service and dataset configuration
- Get Metadata activity configuration
- Pipeline execution and monitoring
- Destination container data validation

## Conclusion
This assignment demonstrates end-to-end Azure data orchestration with metadata-driven validation. It highlights practical use of Azure Blob Storage, Azure Data Factory, and IAM role configuration to build a secure and reliable data pipeline.
