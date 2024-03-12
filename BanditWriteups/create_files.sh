#!/bin/bash

for i in {0..20};
do 
touch "$i->$((i+1)).md"
done

