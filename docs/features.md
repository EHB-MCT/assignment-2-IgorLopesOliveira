## **docs/features.md**
### **Feature Descriptions**
1. **Game Start**:
   - When the game begins, the player is provided with 3 lives. A timer also starts, tracking the time spent on the level.
   - The game initializes all necessary variables and settings.

2. **Game End**:
   - The game ends either when the player loses all 3 lives or successfully completes the level.
   - Once the game ends, all player data (e.g., lives lost, time taken, coins collected) is sent to the backend API for storage in MongoDB.

3. **Player Stats**:
   - The game tracks various player statistics, including:
     - Lives lost (broken down into falls and enemy-related deaths).
     - Total jumps made.
     - Time taken to complete the level.
     - Coins collected.
   - This data is then visualized for the player after each game session.

4. **Backend API**:
   - A backend API handles CRUD operations for player data, ensuring that all player information is stored, retrieved, and displayed efficiently.
   - It is built with Node.js and communicates with MongoDB to store and retrieve data.
