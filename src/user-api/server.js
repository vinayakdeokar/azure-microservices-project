const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.json({ service: "User API", status: "Active", users: ["Vinayak", "Gemini", "DevOps-Engineer"] });
});

app.listen(PORT, () => {
    console.log(`User API running on port ${PORT}`);
});
