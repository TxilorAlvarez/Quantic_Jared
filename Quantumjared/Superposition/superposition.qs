```qsharp
namespace QuantumTutorials {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    /// # Summary
    /// Demonstrates how to put a qubit in superposition and measure it.
    /// A qubit is initialized in |0⟩, put into superposition using Hadamard (H),
    /// and measured to observe the probabilistic outcome.
    operation CreateSuperposition() : Result {
        // Allocate a qubit
        use qubit = Qubit();

        // Print initial state |0⟩
        Message("Initial state of the qubit:");
        DumpMachine();

        // Apply Hadamard gate to create superposition: |0⟩ → (|0⟩ + |1⟩)/√2
        H(qubit);
        Message("State after applying Hadamard (superposition):");
        DumpMachine();

        // Measure the qubit in the Z-basis and store the result
        let result = M(qubit);
        Message($"Measurement result: {result}");

        // Reset the qubit to |0⟩ before releasing
        Reset(qubit);

        return result;
    }

    /// # Summary
    /// Runs CreateSuperposition multiple times to show probabilistic outcomes.
    operation RunSuperpositionDemo(repetitions : Int) : Result[] {
        mutable results = [];
        for _ in 1..repetitions {
            let result = CreateSuperposition();
            set results += [result];
        }
        return results;
    }
}
```