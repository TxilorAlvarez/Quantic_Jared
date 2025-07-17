namespace QuantumTutorials {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    /// # Summary
    /// Creates and measures a Bell state (entangled state) between two qubits.
    /// Applies Hadamard and CNOT to create entanglement, then measures both qubits.
    operation CreateEntanglement() : (Result, Result) {
        // Allocate two qubits
        use (qubit1, qubit2) = (Qubit(), Qubit());

        // Print initial state
        Message("Initial state of the qubits:");
        DumpMachine();

        // Create entanglement: |00⟩ → (|00⟩ + |11⟩)/√2
        H(qubit1); // Apply Hadamard to qubit1
        CNOT(qubit1, qubit2); // Entangle qubit1 and qubit2
        Message("State after creating entanglement (Bell state):");
        DumpMachine();

        // Measure both qubits in the Z-basis
        let result1 = M(qubit1);
        let result2 = M(qubit2);
        Message($"Measurement results: qubit1 = {result1}, qubit2 = {result2}");

        // Reset qubits before releasing
        ResetAll([qubit1, qubit2]);

        return (result1, result2);
    }

    /// # Summary
    /// Runs CreateEntanglement multiple times to show correlated outcomes.
    operation RunEntanglementDemo(repetitions : Int) : (Result, Result)[] {
        mutable results = [];
        for _ in 1..repetitions {
            let result = CreateEntanglement();
            set results += [result];
        }
        return results;
    }
}