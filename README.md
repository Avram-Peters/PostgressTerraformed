# DADU Terraformed

## Purpose
To effectively deploy the PostgreSQL dvdrental sample database into an AWS RDS Postgres instance. 


## Requirements
Terraform

## Deployment
1. Close this repository to your hard drive
2. Navigate to the `/DADU` directory in the command line
3. Enter the command `terraform apply`
    - Requests for the variables will be displayed in the command line
        - BusinessUnit (STL | MSP | DAL | CHI | NYA | ATL | MOB)
        - Capability (SAE | DA | PL)
        - Client (Client name, or internal tracking _i.e. DU_)
        - Owner (Your name)
        - Purpose (**Brief** description)
        - db_identifier (database name *no spaces* _i.e. DADU_Winter_2020)
        - password (master database password)
        - profile (You must have AWS access, and an AWS profile set up on your computer. You can choose a named profile, or the default)
        - vpc (For Daugherty's purposes, please us DADU_DB_VPC)
        
## End of life
``terraform destroy``

