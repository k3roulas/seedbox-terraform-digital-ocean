# Terraform script to create a seedbox with Transmission on Digital Ocean

```bash
cp terraform.tfstate.dist terraform.tfstate
```

Then update variables required in terraform.tfstate

With : 

- token : obtained from https://cloud.digitalocean.com/account/api/tokens
- ssh private_key : uploaded to https://cloud.digitalocean.com/account/security

Create the box with : 

```bash
./up.sh
```

Destroy the box with : 

```bash
./down.sh
```
