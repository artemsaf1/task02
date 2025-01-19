#!/bin/bash

File='files.log'

if [ ! -e $File ]; then
echo File not found
else 
echo File found
fi

zapici=$(wc -l < $File)
unifile=$(awk '{print $2}' $File |sort|uniq|wc -l)
hash=$(awk '{print 3}' $File |sort|uniq|wc -l)
echo $zapici 
echo $unifile
echo $hash