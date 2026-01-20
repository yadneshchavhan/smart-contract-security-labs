Signature Replay Vulnerability

Description
The contract authorizes actions using an off-chain signature but does not
include a nonce or deadline. As a result, the same signature can be reused
multiple times.

Proof of Concept
1. Owner signs a message authorizing a transfer of `amount` to `to`.
2. Call `execute(to, amount, signature)` — transfer succeeds.
3. Call `execute(to, amount, signature)` again using the SAME signature.
4. Observe that the transfer succeeds again.

Impact
An attacker can replay a valid signature multiple times to drain funds.

Recommendation
Include a nonce and deadline in the signed message and increment the nonce
after successful execution.
