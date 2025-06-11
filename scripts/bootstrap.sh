#!/bin/bash
for ENV in dev staging production; do
  terraform -chdir=iac/environments/$ENV init
done
