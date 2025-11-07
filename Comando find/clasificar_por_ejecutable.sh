#!/bin/bash

# Descripción:
#   Este script busca todos los archivos en el directorio actual (y subdirectorios)
#   y los clasifica según si son ejecutables o no.
#   - Los archivos ejecutables se copian al directorio "execu/"
#   - Los archivos no ejecutables se copian al directorio "no-execu/"
#   Si los directorios de destino no existen, se crean automáticamente.

# Crear directorios de destino
mkdir -p execu
mkdir -p no-execu

# Copiar archivos ejecutables
find . -type f -executable -exec cp {} execu/ \;

# Copiar archivos no ejecutables
find . -type f ! -executable -exec cp {} no-execu/ \;