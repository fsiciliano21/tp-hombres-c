from flask import Flask, request, render_template, url_for


app: Flask = Flask(__name__)



if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)