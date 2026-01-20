Delegatecall Vulnerability

Description
The contract performs a `delegatecall` to a user-supplied address.
This allows arbitrary external code to execute in the context of the
contract's storage.

 Proof of Concept
1. Deploy `DelegatecallVulnerable`.
2. Deploy `DelegatecallAttacker`.
3. Call `execute(attackerAddress, attackData)` where `attackData`
   encodes the `attack()` function.
4. Observe that the `owner` variable of `DelegatecallVulnerable`
   is overwritten with the attacker address.

 Impact
An attacker can gain full control of the contract by overwriting
critical storage variables.

 Recommendation
Never perform `delegatecall` to untrusted or user-controlled addresses.
Only use delegatecall with trusted libraries and fixed addresses.
