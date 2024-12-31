# Game Data Submission Project

This document outlines the setup, integration, and reasoning behind the implementation of a system that collects and stores gameplay data from a Godot game into a MongoDB database via an Express.js backend. Below is a detailed breakdown of the project components, installation process, and design choices.

## Project Overview

This project demonstrates the integration of real-time data processing within a game development environment. Gameplay metrics such as jumps, elapsed time, lives, and coins collected are sent from the game to a backend server and stored for analysis.

---

## Setup Instructions

### Backend Setup

#### **Step 1: Clone the Repository**
- **Action**: Clone the project repository from GitHub.
  ```bash
  git clone https://github.com/EHB-MCT/assignment-2-IgorLopesOliveira.git
  ```

#### **Step 2: Navigate to the Backend Directory**
- **Action**: Move into the backend folder.
  ```bash
  cd backend
  ```

#### **Step 3: Install Dependencies**
- **Action**: Install required Node.js modules.
  ```bash
  npm install
  ```

#### **Step 4: Create a .env File**
- **Action**: Add environment variables for configuration.
  ```env
  PORT=5002
  FINAL_URL=<your-mongodb-connection-string>
  ```

#### **Step 5: Start the Server**
- **Action**: Run the backend server.
  ```bash
  npm start
  ```

### Godot Setup

#### **Step 1: Open the Godot Project**
- **Action**: Launch Godot and open the game project folder.

#### **Step 2: Configure HTTPRequest Node**
- **Action**: Ensure the `HTTPRequest` node is properly configured to handle data submission.

#### **Step 3: Update URL in `game_manager.gd`**
- **Action**: Set the backend URL in the script.
  ```gdscript
  var url = "http://localhost:5002/submit-game-data"
  ```

#### **Step 4: Start the Game**
- **Action**: Run the game and verify the connection between the game and the backend server.

---

## Data Transmission and Example

### Backend Endpoint
- **Endpoint**: `/submit-game-data`
- **Request Type**: POST
- **Payload Structure**:
  ```json
  {
      "jumpCount": 22,
      "elapsedTime": 42,
      "livesLeft": 2,
      "coinsCollected": 6
  }
  ```

### Data Captured
- **jumpCount**: Total jumps made during the game.
- **elapsedTime**: Duration (in seconds) to complete the game.
- **livesLeft**: Remaining player lives.
- **coinsCollected**: Total coins collected.

---

## Design Choices

### Backend Design
- **Why Express.js?**
  - Lightweight and efficient for building REST APIs.
  - Simplifies routing and middleware integration.

- **Why MongoDB?**
  - Flexible schema design, ideal for varying game data structures.

### Godot Integration
- **Why HTTPRequest Node?**
  - Built-in capability for asynchronous communication with web services.
  - Simplifies sending data without interrupting gameplay.

### Error Handling
- **Challenges Addressed**:
  - Prevented incomplete or malformed data submissions with validation logic.
  - Debugged HTTP request failures due to incorrect configurations.

---

## Future Enhancements

1. **Data Visualization**:
   - Develop a dashboard to display game statistics and trends.

2. **Player Accounts**:
   - Implement user authentication for personalized data tracking.

3. **Gameplay Improvements**:
   - Leverage collected data insights to refine game mechanics and difficulty balancing.

---

This document provides a comprehensive guide to the setup and reasoning behind the Game Data Submission Project. Updates will be included as additional features and improvements are made.

