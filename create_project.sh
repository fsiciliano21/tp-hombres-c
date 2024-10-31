#!/bin/bash

# Asigna la variable
project_folder_name=$1

# Se fija si existe el proyecto
if ! [[ -d '$project_folder_name' ]]; then
  # Crea el proyecto
  echo "Creando nuevo proyecto"
  mkdir $project_folder_name
  cd $project_folder_name

  # Instala python, pip y python-venv
  if ! python3 --version || ! pip3 --version; then
      echo "Instalando Python y Pip..."
      sudo apt update && sudo apt install -y python3 python3-pip python3.10-venv
  else
      echo "Python y Pip estan instalados"
  fi

  # Entra al virtual-env
  python3 -m venv .venv
  . .venv/bin/activate

  # Instala Flask
  pip3 install Flask
  pipenv install flask
  pipenv shell
  
  # crea los archivos necesarios
  mkdir -p templates static static/css static/images static/js
  touch app.py
else
  echo "Error el proyecto ya existe"
fi
