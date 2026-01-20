## Flash Loan Logic Vulnerability

### Description
The contract allows borrowing based solely on its current balance.
This balance can be artificially inflated within a single transaction
using a flash loan.

### Proof of Concept
1. Attacker obtains a flash loan (simulated by a large temporary deposit).
2. The pool balance is inflated.
3. Attacker calls `borrow()` to drain funds.
4. Flash loan is repaid at the end of the transaction.

### Impact
An attacker can drain the lending pool without providing real collateral.

### Recommendation
Use internal accounting, limit borrow amounts, and add flash-loan
resistance such as time-based checks or reentrancy/loan guards.
