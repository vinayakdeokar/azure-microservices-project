const express = require("express");
const { MongoClient } = require("mongodb");

const app = express();
app.use(express.json());

const client = new MongoClient("mongodb://mongodb-service:27017");

async function start() {

  await client.connect()

  const db = client.db("ecommerce")

  app.post("/order", async (req, res) => {
    const order = { ...req.body, date: new Date() }
    await db.collection("orders").insertOne(order)
    res.send({status:"Order placed"})
  })

  app.get("/order/:username", async (req, res) => {
    const username = req.params.username
    const orders = await db.collection("orders").find({ username }).sort({ date: -1 }).toArray()
    res.json(orders)
  })


  app.listen(3002, () => console.log("Order API running"))

}

start()
