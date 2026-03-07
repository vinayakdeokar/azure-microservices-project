from flask import Flask, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import hashlib

app = Flask(__name__)
CORS(app)

# Replace with your actual Key Vault URL from Screenshot
KV_URL = "https://ecom-keyvault-dev.vault.azure.net/" 
credential = DefaultAzureCredential()
kv_client = SecretClient(vault_url=KV_URL, credential=credential)

# MongoDB Connection
mongo_client = MongoClient("mongodb://mongodb-service:27017/")
db = mongo_client["ecommerce"]
users_col = db["users"]

def get_secure_hash(password):
    # Fetch the secret from Key Vault
    secret_key = kv_client.get_secret("ENCRYPTION-KEY").value
    # Hash password with the secret key
    return hashlib.sha256((password + secret_key).encode()).hexdigest()

@app.route('/register', methods=['POST'])
def register():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    email = data.get('email')

    if users_col.find_one({"username": username}):
        return jsonify({"error": "Username already taken"}), 400

    hashed_password = get_secure_hash(password)
    users_col.insert_one({
        "username": username,
        "email": email,
        "password": hashed_password
    })
    return jsonify({"message": "Registration successful!"}), 201

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data.get('username')
    password = data.get('password')

    user = users_col.find_one({"username": username})
    if user and user['password'] == get_secure_hash(password):
        return jsonify({"message": "Login successful", "user": username}), 200
    
    return jsonify({"error": "Invalid username or password"}), 401

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
