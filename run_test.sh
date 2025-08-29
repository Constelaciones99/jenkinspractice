#!/bin/bash

echo "Activando entorno virtual..."
if [ ! -d "venv" ]; then
echo "El entorno virtual no existe. Creando uno nuevo..."
    python -m venv venv
fi

if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
else
    echo "No se pudo encontrar el script de activación del entorno virtual."
    exit 1
fi

source venv/Scripts/activate

echo "Instalando dependencias..."
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "Ejecutando pruebas con pytest ..."
venv/Scripts/python -m  pytest tests/ --junit-xml=reports/test-results.xml --html=reports/test-report.html --self-contained-html

echo "Pruebas completadas. Los informes se encuentran en el directorio 'reports'."