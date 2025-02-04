#!/bin/sh

# Verificar si se proporcionó el nombre del archivo como argumento
if [ -z "$1" ]; then
  echo "Error: Debe proporcionar el nombre del archivo como argumento."
  exit 1
fi

# Nombre del archivo de entrada
archivo_entrada="$1"

# Extraer el nombre del archivo sin la extensión
nombre_base=$(basename "$archivo_entrada" | cut -d '.' -f 1)

# Nombre de la carpeta de destino
carpeta_destino="$nombre_base"

# Crear la carpeta de destino si no existe
mkdir -p "$carpeta_destino"

# Leer el archivo línea por línea
i=1
while IFS= read -r linea; do
  # Crear un nuevo archivo con el contenido de la línea
  echo "$linea" > "$carpeta_destino/$i.txt"
  i=$((i+1))
done < "$archivo_entrada"

echo "Contenido del archivo '$archivo_entrada' guardado en la carpeta '$carpeta_destino'"
