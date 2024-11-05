#!/bin/bash

# Asigna la variable
nuevo_proyecto=$1

if ! [[ -d '$nuevo_proyecto' ]]; then
  # Crea el proyecto
  echo "Creando nuevo proyecto"
  mkdir $nuevo_proyecto
  cd $nuevo_proyecto

  # Instala python, pip y python-venv
  if ! python3 --version || ! pip3 --version; then
      echo "Instalando Python y Pip..."
      sudo apt update && sudo apt install -y python3 python3-pip python3.10-venv
  else
      echo "Python y Pip estan instalados"
  fi
  
  # crea los archivos necesarios
  mkdir -p templates static static/css static/images static/js
  touch app.py

  # Entra al virtual-env
  python3 -m venv .venv
  . .venv/bin/activate

  # Instala Flask
  pip3 install Flask
  pipenv install flask
  pipenv shell
else
  echo "Error el proyecto ya existe"
fi
