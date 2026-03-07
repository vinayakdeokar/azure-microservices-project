const express = require("express");
const { MongoClient } = require("mongodb");

const app = express();
app.use(express.json());

const client = new MongoClient("mongodb://mongodb-service:27017");
const db = client.db("ecommerce");

app.post("/order", async (req, res) => {
  const order = req.body;
  await db.collection("orders").insertOne(order);
  res.send({ status: "Order placed" });
});

app.listen(3002, () => console.log("Order API running"));
