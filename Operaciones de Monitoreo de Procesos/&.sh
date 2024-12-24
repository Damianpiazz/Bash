#!/bin/bash

sleep 10 &
sleep 15 &
jobs
echo "Matando todos los procesos en segundo plano."
kill %1 %2
