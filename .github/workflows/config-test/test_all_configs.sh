#!/bin/bash

set -e

for filename in /configs/; do
    yamllint -d relaxed ${filename}
done