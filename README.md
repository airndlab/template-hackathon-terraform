# Infrastructure as Code by Terraform

## Local configuration

Official article -
[Configure a provider](https://cloud.yandex.com/en-ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-provider).

### Get secrets from Yandex Cloud

[//]: # (TODO: How?)

- `cloudId` - copy cloud id
- `folderId` - copy folder id
- `saId` - copy sa id
- `./sa-key.json` - get sa key and save to file
- `crId` - copy cr id
- `hackName` - short name of hackathon

### Create `./terraform.tfvars` with secrets

```terraform
cloud_id                 = "{cloudId}"
folder_id                = "{folderId}"
service_account_id       = "{saId}"
service_account_key_file = "./sa-key.json"
container_registry_id    = "{crId}"
hack_name                = "{hackName}"
```

### Set local configuration

```shell
export TF_CLI_CONFIG_FILE=./yandex.tfrc
```

### Init terraform

```shell
export KEY={hackName}/terraform.tfstate
export BUCKET={bucketName}
export ACCESS_KEY={accessKey}
export SECRET_KEY={secretKey}
```

```shell
terraform init -backend-config="key=$KEY" -backend-config="bucket=$BUCKET" -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```

### Lock mirroring

```shell
terraform providers lock -net-mirror=https://terraform-mirror.yandexcloud.net -platform=linux_amd64 -platform=darwin_arm64 yandex-cloud/yandex
```
