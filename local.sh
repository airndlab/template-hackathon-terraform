#!/bin/bash

export TF_CLI_CONFIG_FILE=./provider_installation.tfrc

# TODO: Put your values for S3
export KEY={hack_name}/terraform.tfstate
export BUCKET={bucket}
export ACCESS_KEY={access_key}
export SECRET_KEY={secret_key}

terraform init \
            -backend-config="key=$KEY" \
            -backend-config="bucket=$BUCKET" \
            -backend-config="access_key=$ACCESS_KEY" \
            -backend-config="secret_key=$SECRET_KEY"

terraform providers lock \
            -net-mirror=https://terraform-mirror.yandexcloud.net \
            -platform=linux_amd64 \
            -platform=darwin_arm64 \
            yandex-cloud/yandex
