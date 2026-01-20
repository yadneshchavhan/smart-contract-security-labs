Reentrancy Vulnerability

 Description
The contract performs an external call to `msg.sender` before updating
the user's balance, allowing reentrant calls to `withdraw()`.

Proof of Concept
1. Deploy `ReentrancyVulnerable` and fund it with ETH.
2. Deploy `ReentrancyAttacker` with the vulnerable contract address.
3. Call `attack()` with some ETH.
4. During ETH receipt, the attacker re-enters `withdraw()` multiple times.
5. Observe that the contract balance is drained.

Impact
An attacker can drain all ETH from the contract.

Recommendation
Apply the Checks-Effects-Interactions pattern or use a reentrancy guard.
