const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bcrypt = require('bcryptjs');

const app = express();
app.use(cors());
app.use(express.json());

// MongoDB Connection
// तुझ्या Cluster मधल्या 'mongodb-service' ला कनेक्ट करतोय
mongoose.connect('mongodb://mongodb-service:27017/ecommerce')
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('Could not connect to MongoDB', err));

// User Schema (डेटा कसा दिसेल)
const userSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true }
});

const User = mongoose.model('User', userSchema);

// --- १. Registration API ---
app.post('/users/register', async (req, res) => {
    try {
        const { username, password } = req.body;

        // युजर आधीच आहे का ते तपासा
        let user = await User.findOne({ username });
        if (user) return res.status(400).json({ error: "User already exists" });

        // पासवर्ड Encrypt करा (सुरक्षेसाठी)
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // नवीन युजर सेव्ह करा
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
        console.log(`Login attempt: ${username}`); // टर्मिनलमध्ये दिसेल

        const user = await User.findOne({ username });
        if (!user) {
            return res.status(400).json({ error: "युजर मिळाला नाही!" });
        }

        // पासवर्ड चेक करणे
        const isMatch = await bcrypt.compare(password, user.password);
        console.log(`Password Match Status: ${isMatch}`); // हे महत्वाचे आहे

        if (!isMatch) {
            return res.status(400).json({ error: "पासवर्ड चुकीचा आहे!" });
        }

        res.json({ message: "Login Successful!", username: user.username });
    } catch (err) {
        console.error("Login Error:", err);
        res.status(500).json({ error: "Server Error" });
    }
});
const PORT = 3000;
app.listen(PORT, () => console.log(`User API running on port ${PORT}`));
