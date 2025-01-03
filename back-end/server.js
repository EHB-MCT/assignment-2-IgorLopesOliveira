// Import necessary modules
const express = require('express'); // Express framework for building the API
const cors = require('cors'); // Middleware for Cross-Origin Resource Sharing (CORS)
const { MongoClient } = require('mongodb'); // MongoDB client to interact with the database
require('dotenv').config(); // Load environment variables from a .env file

// Initialize the Express app
const app = express();

// Create a new MongoClient to connect to MongoDB using environment variable for DB URL
const client = new MongoClient(process.env.FINAL_URL);

// Middleware for enabling CORS and handling JSON data
app.use(cors({ origin: 'http://127.0.0.1:5500' })); // Only allow requests from this domain (can be expanded for production)
app.use(express.json()); // Parse JSON data from incoming requests

/**
 *  POST endpoint to submit game data to the database.
 *  Inputs: req.body (game data with jumpCount, elapsedTime, livesLeft, coinsCollected)
 *  Actions: Validate incoming data, connect to MongoDB, insert data into the collection
 *  Outputs: Success or error response to the client
 */
app.post('/submit-game-data', async (req, res) => {
    
    // Destructure game data from request body
    const { jumpCount, elapsedTime, livesLeft, coinsCollected } = req.body;

    // Check for missing required fields in the request body
    if (jumpCount === undefined || elapsedTime === undefined || livesLeft === undefined || coinsCollected === undefined) {
        return res.status(400).send({
            status: "Bad Request", // Respond with a 400 error if data is missing
            message: "Missing required fields: jumpCount, elapsedTime, livesLeft, coinsCollected"
        });
    }

    try {
        // Connect to MongoDB
        await client.connect(); 

        // Prepare the game data for insertion into the database
        const gameData = {
            jumpCount,           // Number of jumps the player made
            elapsedTime,         // Time taken to complete the game (in seconds or milliseconds)
            livesLeft,           // Remaining lives of the player
            coinsCollected,      // Number of coins collected during the game
            submittedAt: new Date(), // Timestamp of when the data was submitted
        };

        // Select the database and collection to store the game data
        const db = client.db('DEV5'); // Use database 'DEV5' (can be abstracted for more flexibility)
        const collection = db.collection('Godot'); // Collection named 'Godot' (can be dynamic if needed)
        
        // Insert the game data into the collection
        const result = await collection.insertOne(gameData);

        // Send a success response with the result of the database operation
        res.status(201).send({
            status: "Success",
            message: "Game data has been saved to the database!",
            data: result // Return the result from the insert operation
        });
    } catch (error) {
        // Catch any errors during the database operation
        console.error("Error saving data:", error);
        res.status(500).send({
            status: "Error",
            message: "Failed to save game data", // Generic error message for the client
            error: error.message // Return the specific error message for debugging purposes
        });
    } finally {
        // Ensure the MongoDB client is closed to avoid connection leaks
        await client.close();
    }
});

/**
 *  GET endpoint to retrieve game data from the database.
 *  Inputs: (optional) query parameters to filter data
 *  Actions: Connect to MongoDB, retrieve data from the collection
 *  Outputs: Retrieved game data or error response
 */
app.get('/game-data', async (req, res) => {
    try {
        // Connect to MongoDB
        await client.connect();
        
        // Select the database and collection to retrieve the game data
        const db = client.db('DEV5'); // Use database 'DEV5'
        const collection = db.collection('Godot'); // Collection named 'Godot'
        
        // Fetch all data or apply filters as necessary
        const gameData = await collection.find({}).toArray(); // Can add filters based on query params (e.g., date range, score, etc.)

        // Send a success response with the fetched game data
        res.status(200).send({
            status: "Success",
            message: "Fetched game data successfully",
            data: gameData // Return the fetched data from the database
        });
    } catch (error) {
        // Catch any errors during the fetch operation
        console.error("Error fetching data:", error);
        res.status(500).send({
            status: "Error",
            message: "Failed to fetch game data", // Generic error message for the client
            error: error.message // Return the specific error message for debugging purposes
        });
    } finally {
        // Ensure the MongoDB client is closed after the operation
        await client.close();
    }
});

// Set the port for the server to listen on
const PORT = process.env.PORT || 10000; // Default to port 5002 if not specified in environment variables

/**
 *  Initialize the server and listen on the specified port.
 *  Inputs: None
 *  Actions: Start the server and log that it is running
 *  Outputs: Console log indicating the server is running
 */
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`); // Log that the server is running
});
