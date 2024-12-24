#!/bin/bash
cat /etc/passwd | grep -w ^so | cut -d: -f1,3 # Importante