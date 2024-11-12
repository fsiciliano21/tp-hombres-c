from flask import Flask, request, render_template, url_for

app: Flask = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/contact")
def contact():
    return render_template("contact.html")

@app.route("/about_us")
def about_us():
    return render_template("about_us.html")

""" @app.route("/liyue")
def liyue():
    return render_template("naciones/liyue/liyue.html") """


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
