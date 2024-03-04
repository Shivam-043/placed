# placed

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Prerequisites

Make sure you have the following installed on your machine:

- Git
- Dart
- flutter 
- Node.js
- npm (Node Package Manager)

### Clone the Repository

```bash
git clone https://github.com/Shivam-043/placed.git
```

## Installation

Navigate to the project directory and install the dependencies:

```bash
cd placed
flutter pub get
cd backend
npm install
```

## Development Workflow

1. **Working Branch:**
   Ensure you are on the "main" branch before making any changes:

   ```bash
   git checkout main
   ```

2. **Create Your Development Branch:**
   Create a new branch with your name appended to "test-dev":
   ```bash
   git checkout -b test-dev-yourname
   ```
3. **Make Changes:**
   Make necessary changes to the code, add, and commit:
   ```bash
   git add .
   git commit -m "Your meaningful commit message here"
   ```
4. **Pull from test-dev Branch:**
    Pull and merge from the test-dev branch:
   ```bash
   git pull origin test-dev
   ```
   Resolve any conflicts that may arise.
4. **Push Changes:**
   Push your changes to your branch:
   ```bash
   git push origin test-dev-yourname
   ```
5. **Create a Pull Request:**
   After completing your feature or fix, it's time to integrate your changes into the main project. Follow these steps to create a pull request on GitHub:

   - Open your web browser and navigate to the [GitHub repository](https://github.com/Shivam-043/placed.git).
   - Switch to your development branch using the branch dropdown menu.
   - Click on the "New Pull Request" button.
   - Set the base branch to "test-dev" and the compare branch to your development branch (e.g., "test-dev-yourname").
   - Review your changes and ensure the pull request title and description are clear and informative.
   - If everything looks good, click the "Create Pull Request" button.
   - Assign the pull request to relevant team members for review.
   - Once approved, the changes will be merged into the "test-dev" branch.

   **Note:** Ensure your pull request follows the contribution guidelines and addresses any conflicts that may arise during the review.
