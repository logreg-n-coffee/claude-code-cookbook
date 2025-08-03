## Code Explain

Provide detailed explanations of code behavior.

### Usage

```bash
# Display file content and request from Claude
cat <file>
"Please explain how this code works"
```

### Basic Examples

```bash
# Understanding Rust ownership
cat main.rs
"Please explain from the perspective of Rust ownership and lifetimes"

# Algorithm explanation
grep -A 50 "quicksort" sort.rs
"Please explain the mechanism and computational complexity of this sorting algorithm"

# Design pattern explanation
cat factory.rs
"Please explain the design patterns used and their advantages"
```

### Claude Integration

```bash
# Beginner-friendly explanation
cat complex_function.py
"Please explain this code line by line in a way that beginners can understand"

# Performance analysis
cat algorithm.rs
"Please identify performance issues in this code and provide improvement suggestions"

# Explanation with diagrams
cat state_machine.js
"Please explain the processing flow of this code with ASCII art diagrams"

# Security review
cat auth_handler.go
"Please point out security concerns in this code"
```

### Detailed Examples

```bash
# Complex logic explanation
cat recursive_parser.rs
"Please explain this recursive parser from the following perspectives:
1. Overall processing flow
2. Role and responsibility of each function
3. Edge case handling
4. Areas for improvement"

# Asynchronous processing explanation
cat async_handler.ts
「この非同期処理について以下を解説して：
1. Promise チェーンの流れ
2. エラーハンドリングの仕組み
3. 並行処理の有無
4. デッドロックの可能性」

# アーキテクチャの説明
ls -la src/ && cat src/main.rs src/lib.rs
「このプロジェクトのアーキテクチャとモジュール構成を解説して」
```

### 注意事項

コード解説では、単に動作を説明するだけでなく、なぜそのような実装になっているか、どのような利点があるか、潜在的な問題点は何かといった深い洞察も提供します。
