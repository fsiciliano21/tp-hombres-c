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
    response = requests.get(API_URL+'personajes')
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
    return render_template("about_us.html")

""" @app.route("/liyue")
def liyue():
    return render_template("naciones/liyue/liyue.html") """

"""@app.route("/")
def personajes():
  try:
    response = requests.get(API_URL+'personajes')
    response.raise_for_status()
    personajes = response.json()
  except requests.exceptions.RequestException as e:
    print(f"Error fetching data: {e}")
    personajes = []

  return render_template('personajes.html', personajes=personajes)
"""

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
