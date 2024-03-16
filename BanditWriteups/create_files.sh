#!/bin/bash

for i in {0..19};
do 
touch "$i->$((i+1)).md"
done

