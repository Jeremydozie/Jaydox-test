"""Creates a sample flask app"""



from flask import Flask



app = Flask(__name__)





@app.route("/")

def hello_world():

    """Print Hello"""

    return "Hello from Flask app deployed by Mekadox!"






if __name__ == "__main__":

    app.run(debug=True, host="0.0.0.0")

