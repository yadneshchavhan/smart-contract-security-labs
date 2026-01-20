## Oracle Manipulation Vulnerability (Spot Price)

### Description
The contract relies on a DEX spot price as an oracle. Spot prices can be
manipulated within a single transaction, especially using large trades
or flash loans.

### Proof of Concept
1. Attacker temporarily manipulates the DEX price (e.g., dumps ETH).
2. Spot price drops sharply.
3. `canLiquidate()` is called during the manipulated price window.
4. The function returns `true` even though the user position is healthy.

### Impact
Users can be unfairly liquidated or positions mispriced, leading to loss
of funds.

### Recommendation
Use a time-weighted average price (TWAP) or a trusted oracle such as
Chainlink. Avoid relying on spot prices for critical decisions.
