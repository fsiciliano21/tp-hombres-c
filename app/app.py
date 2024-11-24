from flask import Flask, request, render_template, url_for, redirect
import requests

import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from api import personajes

API_URL = 'http://127.0.0.1:5001/api/'

app: Flask = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/personaje", methods=["GET"])
def personaje():
    try:
        response = personajes.all_personajes()
        personajes_data = [
            {
                "id": row[0],
                "nombre": row[1],
                "edad": row[2],
                "region": row[3],
                "elemento": row[4],
            }
            for row in response
        ]
    except Exception as e:
        print(f"Error fetching personajes: {e}")
        personajes_data = []

    return render_template("menu/personaje.html", personajes=personajes_data)

@app.route("/personaje/add", methods=["POST"])
def add_personaje():
    try:
        nombre = request.form["nombre"]
        edad = int(request.form["edad"])
        region = request.form["region"]
        elemento = request.form["elemento"]

        response = personajes.add_personaje(nombre, edad, region, elemento)
        if "error" in response:
            return f"Error: {response['error']}", 400
    except Exception as e:
        return f"Error al agregar personaje: {e}", 500

    return redirect(url_for("personaje"))

@app.route("/personaje/delete/<int:personaje_id>", methods=["POST"])
def delete_personaje(personaje_id):
    try:
        response = personajes.delete_personaje(personaje_id)
        if "error" in response:
            return f"Error: {response['error']}", 400
    except Exception as e:
        return f"Error al eliminar personaje: {e}", 500

    return redirect(url_for("personaje"))

@app.route("/personaje/edit/<int:personaje_id>", methods=["GET", "POST"])
def edit_personaje(personaje_id):
    if request.method == "POST":
        try:
            nombre = request.form.get("nombre")
            edad = request.form.get("edad", type=int)
            region = request.form.get("region")
            elemento = request.form.get("elemento")

            response = personajes.update_personaje(
                personaje_id, nombre=nombre, edad=edad, region=region, elemento=elemento
            )
            if "error" in response:
                return f"Error: {response['error']}", 400
        except Exception as e:
            return f"Error al actualizar personaje: {e}", 500

        return redirect(url_for("personaje"))
    else:
        try:
            personaje = personajes.personaje_by_id(personaje_id)[0]
        except Exception as e:
            return f"Error: {e}", 500

        return render_template(
            "menu/edit_personaje.html",
            personaje={
                "id": personaje_id,
                "nombre": personaje[0],
                "edad": personaje[1],
                "region": personaje[2],
                "elemento": personaje[3],
            },
        )



@app.route("/contact")
def contact():
    return render_template("contact.html")

@app.route("/nosotros")
def about_us():
    integrantes = [
        {"apellido":"Gonzalez", "nombre":"Gabriel Leonel", "padron":"112607"},
        {"apellido":"Noriega Nuti", "nombre":"Sofia belen", "padron":"110502"},
        {"apellido":"Rojas Calizaya", "nombre":"Kevin Edgardo", "padron":"109948"},
        {"apellido":"Julian Gilio", "nombre":"Agustin Nahuel", "padron":"111876"},
        {"apellido":"Siciliano", "nombre":"Fransisco", "padron":"108157"},
        {"apellido":"Lopez", "nombre":"Lazaro", "padron":"111312"},
        {"apellido":"Moyano", "nombre":"Benjamin", "padron":"111613"},
    ]
    return render_template("menu/about_us.html", integrantes=integrantes)

@app.route("/personaje/<int:personaje_id>")
def readmore(personaje_id):
    return render_template("menu/readmore.html")

@app.route("/equipos")
def team():
    return render_template("menu/equipos.html")

@app.route("/guia")
def guide():
    return render_template("menu/guia.html")

@app.route("/sumeru")
def sumeru():
    return render_template("naciones/sumeru/sumeru.html")

@app.route("/liyue")
def liyue():
    return render_template("naciones/liyue/liyue.html")

@app.route("/mondstadt")
def mondstadt():
    return render_template("naciones/mondstadt/mondstadt.html")

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
