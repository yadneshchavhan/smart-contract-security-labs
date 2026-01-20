Access Control Vulnerability

### Description
The `setOwner` function is publicly accessible and lacks any access control
modifier. This allows any user to arbitrarily change the contract owner.

 Proof of Concept
1. Deploy the contract from Account A.
2. From a different account (Account B), call setOwner(AccountB).
3. Observe that the owner variable is updated to Account B.
4. Account B can now successfully call sensitiveAction().

 Impact
An attacker can gain full administrative control over the contract,
allowing them to execute privileged actions.

 Recommendation
Restrict access to setOwner by applying an onlyOwner modifier.

