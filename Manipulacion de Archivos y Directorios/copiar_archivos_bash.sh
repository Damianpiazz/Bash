echo "Inicio"  # Mensaje de inicio del script

# Verificar que se haya pasado un directorio como parámetro
if [ ! -d "$1" ]; then
    echo "<Parametro1> debe ser directorio"
    exit
fi

# Crear el directorio "nuevo" si no existe
mkdir -p nuevo

# Buscar archivos que contengan la palabra "bash" y copiarlos al directorio "nuevo"
for archivo in $(grep -lr "bash" "$1"); do
    cp -f "$archivo" "./nuevo"  # Copiar archivo encontrado, sobrescribiendo si ya existe
done