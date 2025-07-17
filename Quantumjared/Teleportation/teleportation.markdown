# Tutorial 3: Quantum Teleportation

## Introduction
Quantum teleportation allows the state of one qubit to be transferred to another qubit using entanglement and classical communication, without physically moving the qubit. This tutorial implements teleportation in Q# using Azure Quantum.

### What is Quantum Teleportation?
Teleportation transfers the quantum state of a qubit (e.g., α|0⟩ + β|1⟩) to another qubit by leveraging an entangled pair and two classical bits. The original qubit’s state is destroyed in the process.

## Code Explanation
The `teleportation.qs` file teleports various quantum states:
- **Qubit Allocation**: Three qubits are used: `message` (state to teleport), `auxiliary` (entangled with `target`), and `target` (receives the state).
- **Entanglement**: A Bell state is created between `auxiliary` and `target` using `H` and `CNOT`.
- **Encoding**: The `message` qubit is entangled with the `auxiliary` qubit via `CNOT` and `H`.
- **Measurement and Correction**: The `message` and `auxiliary` qubits are measured, and their results determine corrections (`X` or `Z`) on the `target` qubit.
- **Testing States**: The code tests teleportation for |0⟩, |1⟩, |+⟩, and |-⟩, measuring in the appropriate basis (Pauli-Z or Pauli-X).

## Circuit Diagram
The quantum circuit for teleportation is:

```
message:  --*--H--M--
            |      
auxiliary: --X-----M--
            |      
target:    ----X-----
```
- `message`: CNOT control, Hadamard, and measurement (`M`).
- `auxiliary`: CNOT target, measurement (`M`).
- `target`: Entangled with `auxiliary` via CNOT, receives corrections (`X`, `Z`) based on classical bits (not shown in circuit).
- Classical control: If `message` measurement is `One`, apply `Z` to `target`; if `auxiliary` measurement is `One`, apply `X`.

Visualize this in [Quirk](https://algassert.com/quirk) by adding the gates as shown and simulating measurements.

## Running the Code
1. **Set up your environment**:
   - Install the Azure Quantum Development Kit and .NET Core SDK.
   - Use Visual Studio Code with the Q# extension.
   - Configure Azure Quantum credentials (see [Azure Quantum Documentation](https://docs.microsoft.com/en-us/azure/quantum/)).
2. **Run the code**:
   ```bash
   dotnet run --project tutorials/teleportation/teleportation.csproj
   ```
3. **Expected Output**:
   - `DumpMachine()` shows the state before and after teleportation.
   - Measurement results match the expected states (|0⟩, |1⟩, |+⟩, |-⟩) on the `target` qubit.
   - Example: For |0⟩, the `target` qubit measures `Zero` in the Z-basis.

## Try It Yourself
- Modify the initial state of the `message` qubit (e.g., apply `S` or `T` gates).
- Experiment with measuring in different bases to verify the teleported state.