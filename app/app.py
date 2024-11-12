from flask import Flask, request, render_template, url_for
import requests

API_URL = 'http://localhost:5001/api/v1/'

app: Flask = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/personaje")
def personaje():
  try:
    response = requests.get(API_URL+'personaje')
    response.raise_for_status()
    personajes = response.json()
  except requests.exceptions.RequestException as e:
    print(f"Error fetching data: {e}")
    personajes = []

    return render_template("personaje.html")

@app.route("/contact")
def contact():
    return render_template("contact.html")

@app.route("/about_us")
def about_us():
    integrantes = [
        {"apellido":"Gonzales", "nombre":"Gabriel Leonel", "padron":"112607"},
        {"apellido":"Noriega Nuti", "nombre":"Sofia belen", "padron":"110502"},
        {"apellido":"Rojas Calizaya", "nombre":"Kevin Edgardo", "padron":"109948"},
        {"apellido":"Julian Gilio", "nombre":"Agustin Nahuel", "padron":"111876"},
        {"apellido":"Siciliano", "nombre":"Fransisco", "padron":"108157"},
        {"apellido":"Lopez", "nombre":"Lazaro", "padron":"111312"},
        {"apellido":"Moyano", "nombre":"Benjamin", "padron":"111613"},
    ]
    return render_template("about_us.html", integrantes=integrantes)

""" @app.route("/liyue")
def liyue():
    return render_template("naciones/liyue/liyue.html") """

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
