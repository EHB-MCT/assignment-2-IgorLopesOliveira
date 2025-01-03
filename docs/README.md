## **README.md**
# Game Project

### **Overview**
This is a Godot-based game integrated with a backend using MongoDB. It tracks important player stats, such as lives lost, jumps, and time taken, which are stored in the database for later retrieval and visualization.

### **Setup Instructions**
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo.git
   ```
2. **Backend Setup**:
   - Navigate to the backend directory:
     ```bash
     cd backend
     ```
   - Install necessary dependencies:
     ```bash
     npm install
     ```
   - Start the server:
     ```bash
     npm start
     ```
3. **Frontend Setup**:
   - Open the Godot project in the editor.
   - Run the project to start playing.

### **Features**
- Tracks player performance metrics, including lives lost, total jumps, time spent, and coins collected.
- The backend stores this data in MongoDB and provides data retrieval for analysis.
- Provides a visualization of player statistics after each session.

### **Contributing**
- Follow the Git workflow outlined in `docs/git-workflow.md`.
- All pull requests must include a description of the changes made and the reasoning behind them.

### **License**
This project is licensed under the MIT License.

### **Documentation**
Refer to the `/docs` folder for more detailed documentation on game features, setup, and development guidelines.
