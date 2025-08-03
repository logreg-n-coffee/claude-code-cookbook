## Error Fix

Identify root causes from error messages and propose proven solutions.

### Usage

```bash
/fix-error [options]
```

### Options

- None : Standard error analysis
- `--deep` : Deep analysis mode (including dependencies and environmental factors)
- `--preventive` : Prevention-focused analysis
- `--quick` : Present only immediately applicable fixes

### Basic Examples

```bash
# Standard error analysis
npm run build 2>&1
/fix-error
"Analyze build errors and present fixing methods"

# Deep analysis mode
python app.py 2>&1
/fix-error --deep
"Analyze root causes of errors including environmental factors"

# Focus on immediate fixes
cargo test 2>&1
/fix-error --quick
"Present immediately applicable fixing methods"

# Prevention-focused
./app 2>&1 | tail -50
/fix-error --preventive
"Present error fixes and future prevention measures"
```

### Claude Integration

```bash
# Error log analysis
cat error.log
/fix-error
"Identify root causes of errors and propose fixing methods"

# Resolving test failures
npm test 2>&1
/fix-error --quick
"Analyze failed tests and present immediately applicable fixes"

# Stack trace analysis
python script.py 2>&1
/fix-error --deep
"Identify problem locations from this stack trace and analyze including environmental factors"

# Resolve multiple errors collectively
grep -E "ERROR|WARN" app.log | tail -20
/fix-error
"Classify these errors and warnings by priority and propose solutions for each"
```

### Error Analysis Priority

#### 🔴 Urgency: High (Immediate response required)

- **Application Shutdown**: Crashes, infinite loops, deadlocks
- **Data Loss Risk**: Database errors, file corruption
- **Security Vulnerabilities**: Authentication failures, permission errors, injections
- **Production Environment Impact**: Deployment failures, service outages

#### 🟡 Urgency: Medium (Early response recommended)

- **Performance Issues**: Memory leaks, delays, timeouts
- **Partial Function Failures**: Specific feature errors, UI glitches
- **Development Efficiency Decline**: Build errors, test failures

#### 🟢 Urgency: Low (Planned response)

- **Warning Messages**: Deprecation, lint errors
- **Development Environment Only**: Local environment only issues
- **Future Risks**: Technical debt, maintainability issues

### Analysis Process

#### Phase 1: Error Information Collection

```bash
🔴 Required Execution:
- Complete retrieval of error messages
- Stack trace confirmation
- Identification of occurrence conditions (reproducibility)

🟡 Early Execution:
- Environment information collection (OS, versions, dependencies)
- Recent change history (git log, recent commits)
- Related log confirmation

🟢 Additional Execution:
- System resource status
- Network state
- External service state
```

#### Phase 2: Root Cause Analysis

1. **Surface Symptom Organization**
   - Exact content of error messages
   - Occurrence timing and patterns
   - Impact scope identification

2. **Deep Cause Identification**
   - Apply 5 Whys analysis
   - Trace dependencies
   - Confirm environmental differences

3. **Hypothesis Verification**
   - Create minimal reproduction code
   - Execute isolation tests
   - Narrow down causes

#### Phase 3: Solution Implementation

```bash
🔴 Immediate Response (Hotfix):
- Minimal fixes to suppress symptoms
- Apply temporary workarounds
- Prepare emergency deployment

🟡 Fundamental Solution:
- Essential fixes for root causes
- Add test cases
- Update documentation

🟢 Prevention Implementation:
- Strengthen error handling
- Set up monitoring and alerts
- Improve CI/CD pipeline
```

### Output Example

```text
🚨 Error Analysis Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📍 Error Overview
├─ Type: [Compile/Runtime/Logic/Environment]
├─ Urgency: 🔴 High / 🟡 Medium / 🟢 Low
├─ Impact Scope: [Function name/Component]
└─ Reproducibility: [100% / Intermittent / Specific conditions]

🔍 Root Cause
├─ Direct Cause: [Specific cause]
├─ Background Factors: [Environment/Settings/Dependencies]
└─ Trigger: [Occurrence conditions]

💡 Solutions
🔴 Immediate Response:
1. [Specific fix commands/code]
2. [Temporary workarounds]

🟡 Fundamental Solution:
1. [Essential fixing methods]
2. [Required refactoring]

🟢 Prevention:
1. [Error handling improvements]
2. [Test additions]
3. [Monitoring setup]

📝 Verification Steps
1. [Confirmation methods after fix application]
2. [Test execution commands]
3. [Operation confirmation items]
```

### Analysis Methods by Error Type

#### Compile/Build Errors

```bash
# TypeScript type errors
Required Check (High):
- tsconfig.json settings
- Type definition files (.d.ts) existence
- Import statement accuracy

# Rust lifetime errors
Required Check (High):
- Ownership transfers
- Reference validity periods
- Mutability conflicts
```

#### Runtime Errors

```bash
# Null/Undefined references
Required Check (High):
- Missing optional chaining
- Initialization timing  
- Asynchronous processing completion waiting

# Memory-related errors
Required Check (High):
- Heap dump acquisition
- GC log analysis
- Circular reference detection
```

#### Dependency Errors

```bash
# Version conflicts
Required Check (High):
- Lock file consistency
- Peer dependencies requirements
- Transitive dependencies

# Module resolution errors
Required Check (High):
- NODE_PATH settings
- Path alias settings
- Symbolic links
```

### Notes

- **Absolutely Prohibited**: Judging based on only part of error messages, applying Stack Overflow solutions without verification
- **Exception Conditions**: Temporary workarounds are permitted only under these 3 conditions:
  1. Production emergency response (fundamental solution required within 24 hours)
  2. External service failure (alternative during recovery wait)
  3. Known framework bugs (waiting for fixed version release)
- **Recommendations**: Prioritize root cause identification and avoid superficial fixes

### Best Practices

1. **Complete Information Collection**: Check error messages from beginning to end
2. **Reproducibility Confirmation**: Prioritize creating minimal reproduction code
3. **Gradual Approach**: Start with small fixes and verify
4. **Documentation**: Record resolution process for knowledge sharing

#### Common Pitfalls

- **Symptom Treatment**: Superficial fixes that miss root causes
- **Over-generalization**: Applying specific case solutions broadly
- **Skipping Verification**: Not checking side effects after fixes
- **Knowledge Silos**: Not documenting solution methods

### Related Commands

- `/design-patterns` : Analyze code structure problems and propose patterns
- `/tech-debt` : Analyze error root causes from technical debt perspective
- `/analyzer` : For cases requiring deeper root cause analysis
