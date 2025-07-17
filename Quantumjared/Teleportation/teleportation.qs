namespace QuantumTutorials {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    /// # Summary
    /// Demonstrates quantum teleportation by sending the state of one qubit to another.
    operation Main() : Result[] {
        // Allocate the message and target qubits
        use (message, target) = (Qubit(), Qubit());

        // Define states to teleport with their initializers and measurement bases
        let stateInitializerBasisTuples = [
            ("|0⟩", I, PauliZ),
            ("|1⟩", X, PauliZ),
            ("|+⟩", SetToPlus, PauliX),
            ("|-⟩", SetToMinus, PauliX)
        ];

        mutable results = [];
        for (state, initializer, basis) in stateInitializerBasisTuples {
            // Initialize the message qubit
            initializer(message);
            Message($"Teleporting state {state}");
            DumpMachine();

            // Teleport the state to the target qubit
            Teleport(message, target);
            Message($"Received state {state}");
            DumpMachine();

            // Measure the target qubit in the appropriate basis
            let result = Measure([basis], [target]);
            set results += [result];
            ResetAll([message, target]);
        }

        return results;
    }

    /// # Summary
    /// Teleports the state of the message qubit to the target qubit using entanglement.
    /// The message qubit is collapsed after teleportation.
    operation Teleport(message : Qubit, target : Qubit) : Unit {
        // Allocate an auxiliary qubit
        use auxiliary = Qubit();

        // Create entanglement between auxiliary and target
        H(auxiliary);
        CNOT(auxiliary, target);

        // Encode the message into the entangled pair
        CNOT(message, auxiliary);
        H(message);

        // Measure message and auxiliary to extract classical bits
        if M(message) == One {
            Z(target);
        }
        if M auxiliary) == One {
            X(target);
        }

        // Reset auxiliary qubit
        Reset(auxiliary);
    }

    /// # Summary
    /// Sets a qubit to |+⟩ = (|0⟩ + |1⟩)/√2.
    operation SetToPlus(q : Qubit) : Unit is Adj + Ctl {
        H(q);
    }

    /// # Summary
    /// Sets a qubit to |-⟩ = (|0⟩ - |1⟩)/√2.
    operation SetToMinus(q : Qubit) : Unit is Adj + Ctl {
        X(q);
        H(q);
    }
}