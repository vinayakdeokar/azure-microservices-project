const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bcrypt = require('bcryptjs');

const app = express();
app.use(cors());
app.use(express.json());

// MongoDB Connection

mongoose.connect('mongodb://mongodb-service:27017/ecommerce')
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('Could not connect to MongoDB', err));

// Health Check route for Azure Application Gateway
app.get('/', (req, res) => res.status(200).send("User API is healthy"));
app.get('/users', (req, res) => res.status(200).send("User API is healthy"));

// User Schema 
const userSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true }
});

const User = mongoose.model('User', userSchema);

// --- १. Registration API ---
app.post('/users/register', async (req, res) => {
    try {
        const { username, password } = req.body;

        
        let user = await User.findOne({ username });
        if (user) return res.status(400).json({ error: "User already exists" });

        
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        
        user = new User({ username, password: hashedPassword });
        await user.save();

        res.status(201).json({ message: "User registered successfully!" });
    } catch (err) {
        res.status(500).json({ error: "Server error during registration" });
    }
});

// --- २. Login API ---
app.post('/users/login', async (req, res) => {
    try {
        const { username, password } = req.body;
        console.log(`Login attempt: ${username}`); 

        const user = await User.findOne({ username });
        if (!user) {
            return res.status(400).json({ error: "User not found!" });
        }

        
        const isMatch = await bcrypt.compare(password, user.password);
        console.log(`Password Match Status: ${isMatch}`); 

        if (!isMatch) {
            return res.status(400).json({ error: "Wrong password please enter correct password!" });
        }

        res.json({ message: "Login Successful!", username: user.username });
    } catch (err) {
        console.error("Login Error:", err);
        res.status(500).json({ error: "Server Error" });
    }
});
const PORT = 3000;
app.listen(PORT, () => console.log(`User API running on port ${PORT}`));
