#!/bin/bash
terraform plan -destroy -out destroy 
terraform apply destroy -auto-approve
