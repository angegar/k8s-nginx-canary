#!/bin/bash 

n=0
while (( n++ < 100 )); do 
    echo $(curl -Lk http://apache.nginx.com) >> result.txt;
done

cat result.txt | grep v0.2 | wc -l