#!/bin/bash

echo "Activando entorno virtual..."
if[ ! -d "venv" ]; then
    python -m venv venv
fi

source venv/Scripts/activate

echo "Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest ..."
pytest tests/ --junit-xml=reports/test-results.xml --html=reports/test-report.html --self-contained-html

echo "Pruebas completadas. Los informes se encuentran en el directorio 'reports'."