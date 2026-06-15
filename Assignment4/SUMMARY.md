# Assignment 4 Summary

## Project Overview
Implemented an Azure Data Factory pipeline to move validated data from an Azure Blob Storage source container to a destination container. The solution includes metadata validation to ensure only valid files are copied.

## Key Tasks Performed
- Provisioned Azure resources for storage and data orchestration.
- Configured Azure Blob Storage source and destination containers.
- Created Azure Data Factory linked services, datasets, and pipeline resources.
- Implemented metadata validation using Get Metadata activity.
- Executed and monitored the pipeline for successful completion.

## Resources Created
- Azure Resource Group
- Azure Storage Account
- Azure Blob Storage containers
- Azure Data Factory instance
- Linked services for Blob Storage access
- Source and destination datasets
- Data Factory pipeline with validation workflow

## Pipeline Workflow
- Source data is stored in Azure Blob Storage.
- Azure Data Factory retrieves metadata from source files.
- Validation rules confirm file properties before execution.
- Valid data is copied into the destination container.
- Pipeline execution is monitored through Azure Data Factory.

## Results Achieved
- Successful metadata inspection for source files.
- Validated data movement from source to destination.
- Secure IAM-based access configuration for Azure resources.
- Monitored pipeline execution with no errors.

## Skills Demonstrated
- Azure Data Factory orchestration
- Azure Blob Storage management
- IAM role-based access control
- Metadata validation workflows
- Pipeline monitoring and troubleshooting

## Final Outcome
Delivered a professional Azure-based ETL pipeline with metadata validation, demonstrating Azure data engineering best practices and secure data movement across cloud resources.
