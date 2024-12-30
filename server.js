const express = require('express');
const cors = require('cors');
const { MongoClient } = require('mongodb');
require('dotenv').config();

const app = express();

const client = new MongoClient(process.env.FINAL_URL);

app.use(cors({ origin: 'http://localhost:5002' }));
app.use(express.json()); 

app.post('/submit-game-data', async (req, res) => {
    
    const { jumpCount, elapsedTime, livesLeft, coinsCollected } = req.body;

    if (jumpCount === undefined || elapsedTime === undefined || livesLeft === undefined || coinsCollected === undefined) {
        return res.status(400).send({
            status: "Bad Request",
            message: "Missing required fields: jumpCount, elapsedTime, livesLeft, coinsCollected"
        });
    }

    try {
        await client.connect(); 

        const gameData = {
            jumpCount,
            elapsedTime,
            livesLeft,
            coinsCollected,
            submittedAt: new Date(), 
        };

        const db = client.db('DEV5');
        const collection = db.collection('Godot');
        const result = await collection.insertOne(gameData);

        res.status(201).send({
            status: "Success",
            message: "Game data has been saved to the database!",
            data: result
        });
    } catch (error) {
        console.error("Error saving data:", error);
        res.status(500).send({
            status: "Error",
            message: "Failed to save game data",
            error: error.message
        });
    } finally {
        await client.close();
    }
});

const PORT = process.env.PORT || 5002;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});