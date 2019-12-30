#Terraform Sample AWS

## Install Terraform
``` bash
wget https://releases.hashicorp.com/terraform/0.8.3/terraform_0.8.3_linux_amd64.zip -O terraform.zip
unzip terraform.zip
rm terraform.zip
sudo mv terraform /usr/local/bin/terraform
```

## Run Sample
Create the variables.tf file with the credentials to access Azure and Amazon WS (How to get ARM credentials )
````
Run terraform get
Run terraform plan
Run terraform apply

