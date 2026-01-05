#!/usr/bin/env bash

mise settings add idiomatic_version_file_enable_tools node

export MISE_NODE_VERIFY=false
mise use -g node@lts
