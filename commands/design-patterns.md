## Design Patterns

Propose applicable design patterns for the codebase and evaluate SOLID principle compliance.

### Usage

```bash
/design-patterns [analysis_target] [options]
```

### Options

- `--suggest` : Propose applicable patterns (default)
- `--analyze` : Analyze usage of existing patterns
- `--refactor` : Generate refactoring proposals
- `--solid` : Check SOLID principle compliance
- `--anti-patterns` : Detect anti-patterns

### Basic Examples

```bash
# Project-wide pattern analysis
/design-patterns

# Pattern suggestions for specific file
/design-patterns src/services/user.js --suggest

# SOLID principle check
/design-patterns --solid

# Anti-pattern detection
/design-patterns --anti-patterns
```

### Analysis Categories

#### 1. Creational Patterns

- **Factory Pattern**: Object creation abstraction
- **Builder Pattern**: Staged construction of complex objects
- **Singleton Pattern**: Instance uniqueness guarantee
- **Prototype Pattern**: Object clone creation

#### 2. Structural Patterns

- **Adapter Pattern**: Interface conversion
- **Decorator Pattern**: Dynamic feature addition
- **Facade Pattern**: Simplification of complex subsystems
- **Proxy Pattern**: Object access control

#### 3. Behavioral Patterns

- **Observer Pattern**: Event notification implementation
- **Strategy Pattern**: Algorithm switching
- **Command Pattern**: Operation encapsulation
- **Iterator Pattern**: Collection traversal

### SOLID Principle Check Items

```
S - Single Responsibility Principle
O - Open/Closed Principle
L - Liskov Substitution Principle
I - Interface Segregation Principle
D - Dependency Inversion Principle
```

### Output Example

```
Design Pattern Analysis Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Currently Used Patterns
├─ Observer Pattern: EventEmitter (12 locations)
├─ Factory Pattern: UserFactory (3 locations)
├─ Singleton Pattern: DatabaseConnection (1 location)
└─ Strategy Pattern: PaymentProcessor (5 locations)

Recommended Patterns
├─ [HIGH] Repository Pattern
│  └─ Target: src/models/*.js
│  └─ Reason: Separation of data access logic
│  └─ Example:
│      class UserRepository {
│        async findById(id) { ... }
│        async save(user) { ... }
│      }
│
├─ [MED] Command Pattern
│  └─ Target: src/api/handlers/*.js
│  └─ Reason: Unified request processing
│
└─ [LOW] Decorator Pattern
   └─ Target: src/middleware/*.js
   └─ Reason: Improve feature combination

SOLID Principle Violations
├─ [S] UserService: Responsible for both authentication and authorization
├─ [O] PaymentGateway: Requires modification when adding new payment methods
├─ [D] EmailService: Directly depends on concrete classes
└─ [I] IDataStore: Contains unused methods

Refactoring Suggestions
1. Split UserService into authentication and authorization
2. Introduce PaymentStrategy interface
3. Define EmailService interface
4. Separate IDataStore by use case
```

### Advanced Usage Examples

```bash
# Impact analysis of pattern application
/design-patterns --impact-analysis Repository

# Generate implementation examples for specific patterns
/design-patterns --generate Factory --for src/models/Product.js

# Suggest pattern combinations
/design-patterns --combine --context "API with caching"

# Evaluate architectural patterns
/design-patterns --architecture MVC
```

### Pattern Application Examples

#### Before (Problematic Code)

```javascript
class OrderService {
  processOrder(order, paymentType) {
    if (paymentType === "credit") {
      // Credit card processing
    } else if (paymentType === "paypal") {
      // PayPal processing
    }
    // Other payment methods...
  }
}
```

#### After (Strategy Pattern Applied)

```javascript
// Strategy interface
class PaymentStrategy {
  process(amount) {
    throw new Error("Must implement process method");
  }
}

// Concrete strategy
class CreditCardPayment extends PaymentStrategy {
  process(amount) {
    /* implementation */
  }
}

// Context
class OrderService {
  constructor(paymentStrategy) {
    this.paymentStrategy = paymentStrategy;
  }

  processOrder(order) {
    this.paymentStrategy.process(order.total);
  }
}
```

### Anti-Pattern Detection

- **God Object**: Classes with excessive responsibilities
- **Spaghetti Code**: Code with complex intertwined control flow
- **Copy-Paste Programming**: Excessive use of duplicate code
- **Magic Numbers**: Hard-coded constants
- **Callback Hell**: Deeply nested callbacks

### Best Practices

1. **Gradual Application**: Don't apply many patterns at once
2. **Verify Necessity**: Patterns are means to solve problems, not goals
3. **Team Consensus**: Discuss with team before applying patterns
4. **Documentation**: Record the intent of applied patterns
