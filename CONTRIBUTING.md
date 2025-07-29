# Contributing to Quantum Tutorials

Thank you for your interest in contributing to **Quantum Tutorials**! This repository is a community-driven effort to teach quantum computing using Azure Quantum and Q#. We welcome contributions from beginners and experts alike, whether you're adding new tutorials, improving code, or enhancing documentation.

## How to Contribute

### 1. Fork the Repository
- Fork the repository to your GitHub account by clicking the "Fork" button on the [repository page](https://github.com/yourusername/quantum-tutorials).
- Clone your fork to your local machine:
  ```bash
  git clone https://github.com/yourusername/quantum-tutorials.git
  cd quantum-tutorials
  ```

### 2. Create a Branch
- Create a new branch for your changes:
  ```bash
  git checkout -b feature/your-feature-name
  ```
- Use descriptive branch names (e.g., `feature/add-grover-tutorial`, `fix/superposition-bug`).

### 3. Make Changes
- Add new tutorials in the `tutorials/` directory, following the structure of existing ones (e.g., `tutorials/new-topic/new-topic.qs` and `tutorials/new-topic/new-topic.md`).
- Ensure Q# code is well-commented and follows the style of existing tutorials.
- Update Markdown files with clear explanations, circuit diagrams (if applicable), and execution instructions.
- Test your code using the Azure Quantum Development Kit:
  ```bash
  dotnet run --project tutorials/your-topic/your-topic.csproj
  ```

### 4. Commit and Push
- Commit your changes with a clear message:
  ```bash
  git add .
  git commit -m "Add new tutorial for Grover's algorithm"
  ```
- Push your branch to your fork:
  ```bash
  git push origin feature/your-feature-name
  ```

### 5. Open a Pull Request
- Go to the original repository and create a pull request (PR) from your branch.
- Include a detailed description of your changes, referencing any issues (if applicable).
- Ensure your PR passes any automated checks (if set up).

## Contribution Guidelines
- **Code Style**: Follow Q# coding conventions (see [Microsoft Q# Style Guide](https://docs.microsoft.com/en-us/azure/quantum/user-guide/language/style)).
- **Documentation**: Include a Markdown file for new tutorials, explaining the concept, code, and how to run it.
- **Testing**: Verify your code runs on the Azure Quantum simulator or hardware (if applicable).
- **Respect**: Adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) to maintain a welcoming community.

## Ideas for Contributions
- New tutorials (e.g., Shor’s algorithm, quantum key distribution).
- Improved circuit visualizations or exercises in existing Markdown files.
- Bug fixes or performance optimizations in Q# code.
- Translation of documentation to other languages.
- Adding Jupyter notebook versions of tutorials.

## Getting Help
- Join our [GitHub Discussions](https://github.com/yourusername/quantum-tutorials/discussions) to ask questions or share ideas.
- Report issues using the repository’s Issues tab.

Thank you for helping make **Quantum Tutorials** a valuable resource for the quantum computing community!
