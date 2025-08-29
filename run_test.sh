#!/bin/bash

# Crear directorio de reports si no existe
mkdir -p reports

echo "Activando entorno virtual..."
if [ ! -d "venv" ]; then
    echo "El entorno virtual no existe. Creando uno nuevo..."
    python3 -m venv venv
fi

# Determinar la ruta correcta según el sistema
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
    PYTHON_EXEC="venv/bin/python"
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
    PYTHON_EXEC="venv/Scripts/python"
else
    echo "No se pudo encontrar el script de activación del entorno virtual."
    exit 1
fi

echo "Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest..."
$PYTHON_EXEC -m pytest tests/ --junit-xml=reports/test-results.xml --html=reports/test-report.html --self-contained-html

echo "Pruebas completadas. Los informes se encuentran en el directorio 'reports'."