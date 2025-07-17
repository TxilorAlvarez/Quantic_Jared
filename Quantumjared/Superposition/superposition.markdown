# Tutorial 1: Superposition in Quantum Computing

## Introduction
Superposition is a fundamental principle of quantum computing, allowing a qubit to exist in a combination of states |0⟩ and |1⟩ simultaneously. This tutorial demonstrates how to create and measure a qubit in superposition using Q# and Azure Quantum.

### What is Superposition?
A qubit in superposition is in a state α|0⟩ + β|1⟩, where α and β are complex numbers determining the probability of measuring |0⟩ or |1⟩. The Hadamard gate (H) transforms a qubit from |0⟩ to a 50/50 superposition: (|0⟩ + |1⟩)/√2.

## Code Explanation    	    


System: **Explanation and Execution**

### How the Code Works
The `superposition.qs` file demonstrates the creation and measurement of a qubit in superposition. Here's a breakdown:

- **Qubit Allocation**: A single qubit is allocated using `use qubit = Qubit();`.
- **Initial State**: The qubit starts in the |0⟩ state.
- **Hadamard Gate**: The `H` operation puts the qubit in superposition: `H(qubit);`.
- **Visualization**: `DumpMachine()` displays the quantum state, showing equal probabilities for |0⟩ and |1⟩.
- **Measurement**: The `M` operation measures the qubit, collapsing it to |0⟩ or |1⟩ with 50% probability each.
- **Repetitions**: The `RunSuperpositionDemo` operation runs the experiment multiple times to demonstrate probabilistic outcomes.

### Running the Code
1. **Set up your environment**:
   - Install the Azure Quantum Development Kit and .NET Core SDK.
   - Configure Visual Studio Code with the Q# extension.
   - Set up Azure Quantum credentials (see [Azure Quantum Documentation](https://docs.microsoft.com/en-us/azure/quantum/)).
2. **Run the code**:
   ```bash
   dotnet run --project tutorials/superposition/superposition.csproj
   ```
3. **Expected Output**:
   - The `DumpMachine()` output will show the qubit’s state before and after the Hadamard gate.
   - Measurement results will show a random sequence of `Zero` and `One` outcomes, approximately 50% each over multiple runs.

### Try It Yourself
- Modify the number of repetitions in `RunSuperpositionDemo` to observe the distribution of outcomes.
- Experiment with measuring in the Pauli-X basis by applying `H` before `M`.