#!/bin/bash

read -p "Enter search term: " searchTerm

encodedSearchTerm=$(echo -n "$searchTerm" | xxd -plain | tr -d '\n')

curl "https://bgp.he.net/search?search%5Bsearch%5D=$encodedSearchTerm" -o as.txt

grep -oE 'AS[0-9]+' as.txt
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+' as.txt

rm as.txt
