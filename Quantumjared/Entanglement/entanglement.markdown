# Tutorial 2: Quantum Entanglement

## Introduction
Quantum entanglement is a phenomenon where two or more qubits become correlated such that the state of one qubit instantly influences the state of another, regardless of distance. This tutorial demonstrates how to create a Bell state, one of the simplest entangled states, using Q# and Azure Quantum.

### What is Entanglement?
A Bell state, such as (|00⟩ + |11⟩)/√2, is a maximally entangled state where measuring one qubit collapses the other to a correlated state. For example, measuring one qubit as |0⟩ ensures the other is also |0⟩.

## Code Explanation
The `entanglement.qs` file creates a Bell state and measures it:
- **Qubit Allocation**: Two qubits are allocated (`qubit1` and `qubit2`).
- **Entanglement Creation**:
  - A Hadamard gate (`H`) on `qubit1` creates superposition: |0⟩ → (|0⟩ + |1⟩)/√2.
  - A CNOT gate entangles `qubit1` and `qubit2`, producing (|00⟩ + |11⟩)/√2.
- **Visualization**: `DumpMachine()` shows the entangled state.
- **Measurement**: Both qubits are measured, showing correlated outcomes (either both `Zero` or both `One`).
- **Repetitions**: `RunEntanglementDemo` runs the experiment multiple times to demonstrate correlation.

## Circuit Diagram
The quantum circuit for creating a Bell state is:

```
q1: --H--*--
         |
q2: -----X--
```
- `q1`: Hadamard gate (`H`) followed by control qubit for CNOT (`*`).
- `q2`: Target qubit for CNOT (`X`).
- After execution, measure both qubits (`M`).

You can visualize this circuit in [Quirk](https://algassert.com/quirk) by adding a Hadamard gate on the first qubit and a CNOT gate with the first qubit as control and the second as target.

## Running the Code
1. **Set up your environment**:
   - Ensure the Azure Quantum Development Kit and .NET Core SDK are installed.
   - Use Visual Studio Code with the Q# extension.
   - Configure Azure Quantum credentials (see [Azure Quantum Documentation](https://docs.microsoft.com/en-us/azure/quantum/)).
2. **Run the code**:
   ```bash
   dotnet run --project tutorials/entanglement/entanglement.csproj
   ```
3. **Expected Output**:
   - `DumpMachine()` shows the initial state |00⟩ and the entangled state (|00⟩ + |11⟩)/√2.
   - Measurements yield correlated results (e.g., `(Zero, Zero)` or `(One, One)`).
   - Over multiple runs, expect ~50% `(Zero, Zero)` and ~50% `(One, One)`.

## Try It Yourself
- Modify the code to measure in the Pauli-X basis by applying `H` to both qubits before measurement.
- Experiment with different Bell states by adjusting the initial gates (e.g., apply `X` to `qubit1` before `H`).