#!/bin/bash

echo "##vso[task.setvariable variable=JOB_TIMESTAMP;]$(date +%y-%m-%d'T'%H.%M.%S)"