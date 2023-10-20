# Infrastructure as Code by Terraform

## Bootstrap Yandex Cloud with Terraform

Use steps below or
[full official doc](https://cloud.yandex.com/en-ru/docs/tutorials/infrastructure-management/terraform-quickstart).

We have created a cloud and have `cloud_id`.

### Create folder

Use [official doc](https://cloud.yandex.com/en-ru/docs/resource-manager/operations/folder/create).

After we have `folder_id`.

### Create service account as `admin`

Use [official doc](https://cloud.yandex.com/en-ru/docs/iam/operations/sa/create).

After we have `sa_id`.

#### Create authorized key

Use [official doc](https://cloud.yandex.com/en-ru/docs/iam/operations/authorized-key/create).

After we have `sa-key.json`.

#### Create static access key

Use [official doc](https://cloud.yandex.com/en-ru/docs/iam/operations/sa/create-access-key).

After we have `access_key` and `secret_key`.

### Create object storage with bucket

Use [official doc](https://cloud.yandex.com/en-ru/docs/storage/quickstart#the-first-bucket).

After we have `bucket`.

## Local development

Official article -
[Configure a provider](https://cloud.yandex.com/en-ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-provider).

### Create `./terraform.tfvars` with secrets

`hack_name` - short name of hackathon.

```terraform
cloud_id                 = "{cloud_id}"
folder_id                = "{folder_id}"
service_account_id       = "{sa_id}"
service_account_key_file = "./sa-key.json"
container_registry_id    = "{crId}"
hack_name                = "{hack_name}"
```

### Set local configuration

```shell
export TF_CLI_CONFIG_FILE=./yandex.tfrc
```

### Init terraform

#### Set backend for s3

```shell
export KEY={hack_name}/terraform.tfstate
export BUCKET={bucket}
export ACCESS_KEY={access_key}
export SECRET_KEY={secret_key}
```

#### Init

```shell
terraform init -backend-config="key=$KEY" -backend-config="bucket=$BUCKET" -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```

### Lock mirroring

```shell
terraform providers lock -net-mirror=https://terraform-mirror.yandexcloud.net -platform=linux_amd64 -platform=darwin_arm64 yandex-cloud/yandex
```
