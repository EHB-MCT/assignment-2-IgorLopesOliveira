## **docs/git-workflow.md**
### **Git Strategy**
1. **Branching**:
   - **feature/**: Used for new features. Example: `feature/level-upgrades`.
   - **fix/**: Used for bug fixes. Example: `fix/game-crash-on-load`.
   - **refactor/**: Used for code improvements without changing functionality. Example: `refactor/game-logic-optimization`.
   
2. **Commit Messages**:
   - Follow the Conventional Commits style for clear and consistent commit messages.
     - `feat`: Adding a new feature (e.g., `feat: add multiplayer mode`).
     - `fix`: Bug fixes (e.g., `fix: resolve issue with jump mechanic`).
     - `docs`: Updates to documentation (e.g., `docs: update README with setup instructions`).
     - `refactor`: Code improvements without changing functionality (e.g., `refactor: simplify game state management`).

3. **Pull Requests**:
   - Pull requests should be submitted when a feature or fix is ready for review. It must be reviewed by at least one other team member before being merged into the main branch.
   - Each pull request should include a description of the changes made and reference any related issues.

4. **Rebasing**:
   - Use `git rebase` to keep the commit history clean before merging changes to the main branch, ensuring that each commit is logically organized and without unnecessary merge commits.
