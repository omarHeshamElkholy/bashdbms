#!/usr/bin/bash

if [ -z "$(ls -A ./databases)" ]; then
   echo "No Databases to list"
else
   ls ./databases
fi