## Front-Running (MEV) Vulnerability

### Description
The contract accepts bids directly on-chain without any commit-reveal
mechanism. Attackers can observe pending transactions and submit a
higher bid with greater gas to be mined first.

### Proof of Concept
1. User submits a bid transaction with value X.
2. Attacker observes the pending transaction in the mempool.
3. Attacker submits a bid with value X+1 and higher gas.
4. Attacker's transaction is mined first.
5. User's bid reverts or loses.

### Impact
Honest users can be consistently outbid unfairly, leading to loss
of funds and broken auction fairness.

### Recommendation
Use a commit-reveal scheme, batch settlement, or sealed-bid auctions
to prevent transaction ordering manipulation.
