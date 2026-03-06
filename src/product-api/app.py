from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def get_products():
    products = [
        {"id": 1, "name": "Laptop", "price": 50000},
        {"id": 2, "name": "Mobile", "price": 20000}
    ]
    return jsonify({"service": "Product API", "status": "Running", "products": products})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
