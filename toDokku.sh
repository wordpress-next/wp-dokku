#!/bin/bash

git add -A; git commit --amend --no-edit; git push dokku master -f
