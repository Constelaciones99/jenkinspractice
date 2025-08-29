#!/bin/bash

echo "Activando entorno virtual..."
source venv/bin/activate

echo "Instalando dependencias..."
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest ..."
pytest tests/ --junit-xml=reports/test-results.xml --html=reports/test-report.html --self-contained-html

echo "Pruebas completadas. Los informes se encuentran en el directorio 'reports'."