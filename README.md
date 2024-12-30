# Progress Log

This document outlines the progress and reasoning behind the development of the game project, from initial setup to final implementation. Below is a detailed timeline of the steps taken, challenges encountered, and solutions implemented.

## Timeline and Progress

### **December 18, 2024**
#### **Project Setup**
- **Action**: Initialized the game project in Godot, defining core mechanics such as scoring, player lives, and elapsed time.
- **Reasoning**: To establish a foundation for the game, focusing on gameplay mechanics before integrating data collection and backend functionalities.

### **December 20, 2024**
#### **Backend Development**
- **Action**: Created a Node.js backend using Express to handle game data submissions.
- **Setup Details**:
  - Connected the backend to MongoDB for data storage.
  - Added a POST endpoint (`/submit-game-data`) to accept game data.
- **Reasoning**: Needed a reliable backend to store and manage game statistics for analysis and visualization.

### **December 23, 2024**
#### **Database Configuration**
- **Action**: Configured MongoDB and tested inserting game data.
- **Challenges**:
  - Encountered and resolved issues with MongoDB connection using environment variables for the database URL.
- **Solution**:
  - Implemented error handling for database operations.
- **Reasoning**: Ensured secure and scalable storage for player data.

### **December 24, 2024**
#### **Godot HTTP Integration**
- **Action**: Integrated Godot's `HTTPRequest` node to send POST requests to the backend.
- **Challenges**:
  - Debugged issues with connecting signals and handling JSON payloads.
  - Resolved errors related to HTTP request configurations.
- **Solution**:
  - Ensured proper use of `PackedByteArray` for JSON data serialization.
  - Validated the presence of the HTTPRequest node and the response handler method.
- **Reasoning**: Enabled the game to communicate with the backend seamlessly.

### **December 25, 2024**
#### **Testing and Debugging**
- **Action**: Conducted end-to-end testing of the game and backend.
- **Steps**:
  - Verified that game data, such as `jumps_made`, `lives_left`, and `elapsed_time`, were accurately submitted to MongoDB.
  - Fixed bugs in both Godot and Node.js code.
- **Reasoning**: Ensured the stability and reliability of the entire system.

### **December 26, 2024**
#### **Final Adjustments and Deployment**
- **Action**:
  - Cleaned up the codebase and added comments for clarity.
  - Wrote this documentation (`progress.md`) to detail the development process.
- **Reasoning**: Prepared the project for submission, with clear reasoning for design choices.

## Design Choices

### Backend Design
- **Why Express and MongoDB?**
  - Express is lightweight and straightforward for creating REST APIs.
  - MongoDB offers flexible, schema-less storage ideal for game data.

### Godot Integration
- **Why HTTP Requests?**
  - Simplified communication with the backend using Godot's built-in tools.
  - Allowed asynchronous data submission without disrupting gameplay.

### Error Handling
- **Challenges Addressed**:
  - Handled missing or malformed data in POST requests.
  - Debugged HTTP request failures due to incorrect data types or server-side issues.

## Future Work
- **Dashboard**: Develop a web-based dashboard to visualize game statistics.
- **Player Authentication**: Introduce user accounts for personalized data tracking.
- **Enhanced Gameplay**: Add new levels and features based on collected data insights.

---
This document will be updated with any further developments or adjustments to the project.