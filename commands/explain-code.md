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
"Explain this asynchronous processing from the following perspectives:
1. Promise chain flow
2. Error handling mechanism
3. Presence of concurrent processing
4. Possibility of deadlocks"

# Architecture explanation
ls -la src/ && cat src/main.rs src/lib.rs
"Explain the architecture and module structure of this project"
```

### Notes

Code explanations provide not only behavioral descriptions but also deep insights into why implementations are done in certain ways, what advantages they have, and what potential issues exist.
