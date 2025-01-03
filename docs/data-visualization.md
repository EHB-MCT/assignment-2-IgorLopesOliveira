## **docs/data-visualization.md**
### **Visualization Decisions**
- **Stats to Display**:
  - **Lives Lost**: Shows how many times the player lost a life, categorized by the cause (fall or enemy).
  - **Total Jumps**: Counts the number of jumps the player made during the game.
  - **Time Taken**: Displays the total time it took the player to complete the game or level.
  - **Coins Collected**: Tracks the number of coins the player collected during the game.

- **Visualization Tools**: To make the data easily digestible, bar charts and pie charts are used. These types of visualizations are effective in summarizing multiple values in a compact form.
  - **Bar Charts**: For comparing numerical values (e.g., lives lost vs. coins collected).
  - **Pie Charts**: For displaying proportions (e.g., fall vs. enemy for lives lost).

- **Colors**: Different colors are used to represent each metric to make the charts easy to understand at a glance. For example:
  - **Red** for lives lost.
  - **Yellow** for coins collected.
  - **Blue** for time taken.
  - **Green** for total jumps.

- **Preattentive Attributes**: Critical values are highlighted using size (larger bars/pie slices) and color (brighter, contrasting colors) to immediately draw attention to the most important statistics, helping users quickly assess their performance.
