## Refactor

Implement safe and gradual code refactoring while evaluating SOLID principle compliance.

### Usage

```bash
# Identify complex code and refactoring plan
find . -name "*.js" -exec wc -l {} + | sort -rn | head -10
"Please refactor large files to reduce complexity"

# Detect and integrate duplicate code
grep -r "function processUser" . --include="*.js"
"Please consolidate duplicate functions using Extract Method"

# Detect SOLID principle violations
grep -r "class.*Service" . --include="*.js" | head -10
"Please evaluate whether these classes follow the single responsibility principle"
```

### Basic Examples

```bash
# Detect long methods
grep -A 50 "function" src/*.js | grep -B 50 -A 50 "return" | wc -l
"Please split methods over 50 lines using Extract Method"

# Conditional complexity
grep -r "if.*if.*if" . --include="*.js"
"Please improve nested conditional statements with Strategy pattern"

# Code smell detection
grep -r "TODO\|FIXME\|HACK" . --exclude-dir=node_modules
"Please resolve comments that have become technical debt"
```

### Refactoring Techniques

#### Extract Method

```javascript
// Before: Long method
function processOrder(order) {
  // 50 lines of complex processing
}

// After: Responsibility separation
function processOrder(order) {
  validateOrder(order);
  calculateTotal(order);
  saveOrder(order);
}
```

#### Replace Conditional with Polymorphism

```javascript
// Before: switch statement
function getPrice(user) {
  switch (user.type) {
    case 'premium': return basPrice * 0.8;
    case 'regular': return basePrice;
  }
}

// After: Strategy pattern
class PremiumPricing {
  calculate(basePrice) { return basePrice * 0.8; }
}
```

### SOLID Principle Check

```text
S - Single Responsibility
├─ Each class has a single responsibility
├─ Reasons for change are limited to one
└─ Boundaries of responsibility are clear

O - Open/Closed
├─ Open to extension
├─ Closed to modification
└─ Protect existing code when adding new features

L - Liskov Substitution
├─ Substitutability of derived classes
├─ Contract compliance
└─ Maintaining expected behavior

I - Interface Segregation
├─ Appropriately granular interfaces
├─ Avoid dependencies on unused methods
└─ Role-based interface definition

D - Dependency Inversion
├─ Depend on abstractions
├─ Separation from concrete implementations
└─ Utilize dependency injection
```

### Refactoring Procedure

1. **Current State Analysis**
   - Complexity measurement (cyclomatic complexity)
   - Duplicate code detection
   - Dependency analysis

2. **Gradual Execution**
   - Small steps (15-30 minute units)
   - Test execution after each change
   - Frequent commits

3. **Quality Confirmation**
   - Maintain test coverage
   - Performance measurement
   - Code review

### Common Code Smells

- **God Object**: Class with excessive responsibilities
- **Long Method**: Methods exceeding 50 lines
- **Duplicate Code**: Duplication of the same logic
- **Large Class**: Classes exceeding 300 lines
- **Long Parameter List**: 4 or more parameters

### Automation Support

```bash
# Static analysis
npx complexity-report src/
sonar-scanner

# Code formatting
npm run lint:fix
prettier --write src/

# Test execution
npm test
npm run test:coverage
```

### Notes

- **Prohibit functional changes**: Don't change external behavior
- **Test first**: Add tests before refactoring
- **Gradual approach**: Don't make large changes at once
- **Continuous verification**: Run tests at each step
