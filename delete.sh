#!/bin/bash

if (ls | grep public)
then echo "removing old Key files"
rm -r -f public*
fi

if(ls | grep private)
then echo "removing old Key files"
rm -r -f private*
fi
rm -rf latency_file
rm -rf file
