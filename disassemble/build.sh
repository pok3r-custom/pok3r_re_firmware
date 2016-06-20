#!/bin/bash

cat fw117.txt | sed -E "s/;.*//" | grep -Ev "^[0-9a-zA-Z_]+:\s*$" | sed -E "s/.{13}(.{2})(.{2}) (.{2})(.{2}).*/\2\1\4\3/" | xxd -r -p > fw117.out
