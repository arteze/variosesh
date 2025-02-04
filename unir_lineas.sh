#!/bin/sh

# Verificar si se proporcionó el nombre de la carpeta como argumento
if [ -z "$1" ]; then
  echo "Error: Debe proporcionar el nombre de la carpeta como argumento."
  exit 1
fi

# Nombre de la carpeta de entrada
carpeta_entrada="$1"

# Nombre del archivo de salida
archivo_salida="$1.txt"

# Verificar si la carpeta existe
if [ ! -d "$carpeta_entrada" ]; then
  echo "Error: La carpeta '$carpeta_entrada' no existe."
  exit 1
fi

# Buscar todos los archivos dentro de la carpeta y sus subcarpetas
find "$carpeta_entrada" -type f -print0 | while IFS= read -r -d $'\0' archivo; do
  # Leer el archivo línea por línea y añadirlo al archivo de salida
  while IFS= read -r linea; do
    echo "$linea" >> "$archivo_salida"
  done < "$archivo"
done

echo "Contenido de los archivos en '$carpeta_entrada' guardado en '$archivo_salida'"
