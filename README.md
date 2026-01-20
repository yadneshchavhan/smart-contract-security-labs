# Smart Contract Security Labs 🔐

This repository contains hands-on security labs for common and critical
Solidity / DeFi vulnerabilities.  
Each lab includes:
- A vulnerable smart contract
- (When required) an attacker contract
- A clear Proof of Concept (PoC)
- Impact and remediation notes

The goal of this repository is to demonstrate my practical understanding
of smart contract auditing and Web3 security.

---

## 📂 Vulnerability Labs

### 🔴 Access Control
- Missing `onlyOwner`
- Privilege escalation via public admin functions  
📁 `access-control/`

### 🔴 Reentrancy
- External call before state update
- Recursive withdrawals  
📁 `reentrancy/`

### 🔴 Delegatecall Misuse
- Delegatecall to user-controlled address
- Storage overwrite / ownership takeover  
📁 `delegatecall/`

### 🔴 Signature Replay
- Missing nonce and deadline
- Reuse of valid signatures  
📁 `signature-replay/`

### 🔴 Uninitialized Proxy
- Public `initialize()` function
- Proxy ownership takeover  
📁 `proxy-uninitialized/`

### 🔴 Oracle Manipulation
- Spot price oracle usage
- Price manipulation leading to liquidation  
📁 `oracle-manipulation/`

### 🔴 Flash Loan Logic Bug
- Balance-based assumptions
- Single-transaction pool drain  
📁 `flash-loan/`

### 🔴 Front-Running / MEV
- Transaction ordering manipulation
- Auction / bidding unfairness  
📁 `front-running/`

---

## 🛠 Tools & Approach
- Solidity `^0.8.x`
- Remix / Manual PoC
- GitHub-based documentation
- Audit-style reporting
