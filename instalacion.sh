#!/bin/bash


# crea los archivos necesarios
mkdir -p app api
mkdir -p app/templates app/static app/static/css app/static/images app/static/js
touch app/app.py

# Entra al virtual-env
python3 -m venv .venv
source .venv/bin/activate

# Instala las librerias necesarias de requeriments.txt
pip install -r requirements.txt

