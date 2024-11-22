from flask import Flask, request, render_template, url_for
import requests

API_URL = 'http://localhost:5001/api/v1/'

app: Flask = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/mapa_interactivo")
def mapa_interactivo():
    return render_template("mapa_interactivo.html")

@app.route("/personajes")
def personajes():
  try:
    response = requests.get(API_URL+'personajes')
    response.raise_for_status()
    personajes = response.json()
  except requests.exceptions.RequestException as e:
    print(f"Error fetching data: {e}")
    personajes = []

    return render_template("menu/personajes.html")

@app.route("/nosotros")
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
    return render_template("menu/nosotros.html", integrantes=integrantes)

@app.route("/equipos")
def team():
    personajes = [
        {"nombre":"Diluc", "elemento":"Pyro", "arma":"Claymore", "rol":"DPS"},
        {"nombre":"Venti", "elemento":"Anemo", "arma":"Arco", "rol":"Support"},
        {"nombre":"Jean", "elemento":"Anemo", "arma":"Espada", "rol":"DPS"},
        {"nombre":"Klee", "elemento":"Pyro", "arma":"Catalizador", "rol":"DPS"},
        {"nombre":"Zhongli", "elemento":"Geo", "arma":"Lanza", "rol":"DPS"},
        {"nombre":"Ganyu", "elemento":"Cryo", "arma":"Arco", "rol":"DPS"},
        {"nombre":"Albedo", "elemento":"Geo", "arma":"Espada", "rol":"DPS"},
        {"nombre":"Xiao", "elemento":"Anemo", "arma":"Lanza", "rol":"DPS"},
        {"nombre":"Eula", "elemento":"Cryo", "arma":"Claymore", "rol":"DPS"},
        {"nombre":"Ayaka", "elemento":"Cryo", "arma":"Espada", "rol":"DPS"},
        {"nombre":"Kazuha", "elemento":"Anemo", "arma":"Espada", "rol":"DPS"},
        {"nombre":"Yoimiya", "elemento":"Pyro", "arma":"Arco", "rol":"DPS"},
        {"nombre":"Sayu", "elemento":"Anemo", "arma":"Claymore", "rol":"DPS"},
        {"nombre":"Raiden", "elemento":"Electro", "arma":"Espada", "rol":"DPS"},
        {"nombre":"Sara", "elemento":"Electro", "arma":"Arco", "rol":"DPS"},
        {"nombre":"Kokomi", "elemento":"Hidro", "arma":"Catalizador", "rol":"DPS"},
        {"nombre":"Thoma", "elemento":"Pyro", "arma":"Lanza", "rol":"DPS"},
        {"nombre":"Yae", "elemento":"Electro", "arma":"Catalizador", "rol":"DPS"}]
    return render_template("menu/equipos.html", personajes=personajes)

@app.route("/guia")
def guide():
    return render_template("menu/guia.html")

@app.route("/mondstadt")
def mondstadt():
    return render_template("naciones/mondstadt/mondstadt.html")

@app.route("/sonata")
def sonata():
    return render_template("naciones/mondstadt/sonata.html")

@app.route("/liyue")
def liyue():
    return render_template("naciones/liyue/liyue.html")

@app.route("/contrato")
def contrato():
    return render_template("naciones/liyue/contrato.html")

@app.route("/inazuma")
def inazuma():
    return render_template("naciones/inazuma/inazuma.html")

@app.route("/sumeru")
def sumeru():
    return render_template("naciones/sumeru/sumeru.html")

@app.route("/cuento")
def cuento():
    return render_template("naciones/sumeru/cuento.html")

@app.route("/fontaine")
def fontaine():
    return render_template("naciones/fontaine/fontaine.html")

@app.route("/natlan")
def natlan():
    return render_template("naciones/natlan/natlan.html")

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
