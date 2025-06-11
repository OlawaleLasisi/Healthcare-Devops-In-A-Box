#!/bin/bash
ENV=$1
terraform -chdir=iac/environments/$ENV apply -auto-approve
