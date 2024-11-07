#!/bin/bash

# Instala python, pip y python-venv
if ! python3 --version || ! pip3 --version; then
    echo "Instalando Python y Pip..."
    sudo apt update && sudo apt install -y python3 python3-pip python3.10-venv
else
    echo "Python y Pip estan instalados"
fi

# crea los archivos necesarios
mkdir -p app api 
touch app.py
mkdir -p app/templates app/static app/static/css app/static/images app/static/js

# Entra al virtual-env
python3 -m venv .venv
source .venv/bin/activate

# Instala Flask
pip3 install Flask
pipenv shell

