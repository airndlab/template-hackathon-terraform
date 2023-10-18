# Infrastructure as Code by Terraform

## Local configuration

[Configure a provider](https://cloud.yandex.com/en-ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-provider).

```shell
export TF_CLI_CONFIG_FILE=./yandex.tfrc
export YC_SERVICE_ACCOUNT_KEY_FILE=./sa-key.json
```

```shell
terraform init
```

```shell
terraform providers lock -net-mirror=https://terraform-mirror.yandexcloud.net -platform=linux_amd64 -platform=darwin_arm64 yandex-cloud/yandex
```
