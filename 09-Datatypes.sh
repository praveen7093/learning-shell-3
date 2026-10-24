#!/bin/bash

var1=10
var2=20
var3=praveen

echo "$var1+$var2"
echo "$(($var1+$var2+$var3))"

declare -i COUNT=5
COUNT=COUNT+1

echo "count is: $COUNT"
