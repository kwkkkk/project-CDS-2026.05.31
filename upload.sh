#!/bin/bash

git add output/
git commit -m "Nova coleta $(date '+%Y-%m-%d %H:%M:%S')"
git push
