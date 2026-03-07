from flask import Flask, jsonify
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://mongodb-service:27017/")
db = client["ecommerce"]

@app.route("/products")
def products():
    products = list(db.products.find({}, {"_id":0}))
    return jsonify(products)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3001)
