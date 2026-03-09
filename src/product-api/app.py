from flask import Flask, jsonify
from pymongo import MongoClient
from flask_cors import CORS

app = Flask(__name__)
CORS(app) # He browser sathi khup garjeche ahe

# Cluster madhe 'mongodb-service' vapra
client = MongoClient("mongodb://mongodb-service:27017/")
db = client["ecommerce"]

@app.route("/products") # Path /products theva
def get_products():
    try:
        # DB madhun data fetech kara
        products = list(db.products.find({}, {"_id": 0}))
        return jsonify(products)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3001) # Port 3001
