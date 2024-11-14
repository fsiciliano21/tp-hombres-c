<h1 align="center">TP: "Los viajeros de Teyvat"</h1>

<h2 align="center">Por "Los Hombres C"</h2>

## Prólogo del Aventurero

*Este trabajo práctico se presenta como una fascinante visita guiada a cada nación, narrada por su arconte. En nuestras travesías, exploraremos las historias y leyendas que dan vida a cada rincón de Teyvat.*

*Además, te ofreceremos consejos y estrategias para potenciar a tus personajes y optimizar sus composiciones, asegurando que estés preparado para enfrentar cualquier desafío que se presente en tu camino.*

<h2 align="center"> Capítulo 1:</h2>

### Instalaciones

*En este primer capítulo, encontrarás una guía para instalar los recursos necesarios para tu aventura en Teyvat. A continuación, te presentamos el listado de packs que podrás descargar:*

- $ git clone --depth=1 "git@github.com:fsiciliano21/tp-hombres-c.git"
- $ mkdir -p tevyat
- $ cp tp-hombres-c/create_project.bash tp-hombres-c/requirements.txt tevyat/
- $ cd tevyat/
- $ bash create_proyect.bash # Esto crea los archivos necesarios para Flask
- $ pip3 requirements.txt # Esto instala las dependencias necesarias para Flask y mysql
- $ cp ../tp-hombres-c.git/api/* api/
- $ cp ../tp-hombres-c.git/app/* app/
- $ sudo mariadbd-safe --skip-grant-tables & disown
- $ mariadb-safe -u root -p < api/crear_tablas.sql

Para ejecutar el front, se debe entrar al directorio /app y ejecturae los siguientes comandos.
- $ export FLASK_APP=app.py
- $ flask run
