const express = require('express');
const app = express();
const PORT = 4000;

app.get('/', (req, res) => {
    res.json({ 
        service: "Order API", 
        status: "Active", 
        message: "Order placed successfully!",
        orderId: Math.floor(Math.random() * 10000)
    });
});

app.listen(PORT, () => {
    console.log(`Order API running on port ${PORT}`);
});
