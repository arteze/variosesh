#!/bin/bash

# Verifica si se proporciona la carpeta como argumento
if [ -z "$1" ]; then
  echo "Error: Debe proporcionar la carpeta como argumento."
  exit 1
fi

carpeta="$1"

# Verifica si la carpeta existe
if [ ! -d "$carpeta" ]; then
  echo "Error: La carpeta '$carpeta' no existe."
  exit 1
fi

# Encuentra todos los archivos .txt en la carpeta, los ordena numéricamente
# y los concatena en unido.txt
find "$carpeta" -maxdepth 1 -name "*.txt" | sort -V | xargs cat > "$1.txt"

echo "Archivos unidos en $1.txt"
