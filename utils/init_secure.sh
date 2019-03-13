#!/bin/bash

SO=`uname -r | awk -F - '{print $4}'`
if [ $SO = "ARCH" ]
then
  ./secure_arch.sh
else
  echo "I don't know what system is..."
fi

