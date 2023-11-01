#!/usr/bin/env bash

git clone github.com/Spreeha/Building-a-CI-CD-Pipeline.git
make setup
source ~/.testapp98/bin/activate
cd testapp98
make all
az webapp up -n testapp98 --sku F1
