# Game Project

### **Overview**
This is a Godot-based game integrated with a backend using MongoDB. It tracks important player stats, such as lives lost, jumps, and time taken, which are stored in the database for later retrieval and visualization.

---

### **Setup Instructions**

1. **Clone the Repository**:
   Clone the project repository to your local machine:
   ```bash
   git clone https://github.com/EHB-MCT/assignment-2-IgorLopesOliveira.git
   ```

2. **Open in VSCode**:
   Open the cloned repository in Visual Studio Code for further setup.

3. **Backend Setup**:
   - Navigate to the backend directory:
     ```bash
     cd assignment-2-IgorLopesOliveira/back-end
     ```
   - Install dependencies:
     ```bash
     npm install
     ```
   - Start the backend server:
     ```bash
     npm run dev
     ```

4. **Frontend Setup**:
   - Navigate to the `front-end` directory and enable live server:
     ```bash
     Go Live
     ```

5. **Godot Game Setup**:
   - Open the Godot project file (`project.godot`) in the Godot editor.
   - Play the game:
     - Upon game completion, data such as lives lost, total jumps, and time taken will be sent to the backend.
   - Visualize the collected data in the frontend.

---

### **Features**
- Tracks player performance metrics, including:
  - Lives lost
  - Total jumps
  - Time spent
  - Coins collected
- Backend stores data in MongoDB for analysis.
- Displays player statistics in the frontend after each session.

---

### **Contributing**
- Follow the Git workflow outlined in `docs/git-workflow.md`.
- Include a description of your changes and the reasoning behind them in every pull request.

---

### **License**
This project is licensed under the MIT License.

---

### **Documentation**
Refer to the `/docs` folder for detailed information on:
- Game features
- Setup process
- Development guidelines

### **ChatGPT links**
- https://chatgpt.com/share/67783cf1-2a24-800d-9290-98c8946e8898
- https://chatgpt.com/share/67783d15-4278-800d-a336-654bb7dc6300
- https://chatgpt.com/share/67783d26-96e4-800d-93c0-4742cd0d1318
- https://chatgpt.com/share/67783d4a-9898-800d-9f2a-07439cf00858
- https://chatgpt.com/share/67783d5e-d148-800d-ac9c-bb53e32cc3a5
