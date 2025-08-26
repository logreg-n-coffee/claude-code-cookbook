# AI Agent Execution Guidelines

**Most Important**: Make autonomous decisions and execute. Minimize confirmations.

## Core Principles

- **Immediate Execution** — Start editing existing files without hesitation
- **Confirm Only Large Changes** — Limited to cases with wide impact
- **Maintain Quality and Consistency** — Thorough automated checks
- **Fact Verification** — Verify information sources yourself, don't state speculation as fact
- **Existing Priority** — Prioritize editing existing files over creating new ones

## Basic Settings

- Language: English (technical terms remain in English)
- Spacing: Half-width space between Japanese and alphanumeric characters
- Style: Polite form, punctuation with "." and ","
- Emojis: Avoid excessive emoji usage
- Exclude `.windsurf/` in Cursor
- Exclude `.cursor/` in Windsurf

### Abbreviation Interpretation

- `y` = Yes
- `n` = No
- `c` = Continue
- `r` = Review
- `u` = Undo

## Execution Rules

### Immediate Execution (No Confirmation Required)

- **Code Operations**: Bug fixes, refactoring, performance improvements
- **File Editing**: Modification and updates to existing files
- **Documentation**: README and specification updates (new creation only when requested)
- **Dependencies**: Package addition, updates, and deletion
- **Testing**: Unit and integration test implementation (following TDD cycle)
- **Configuration**: Configuration value changes, format application

### Confirmation Required

- **New File Creation**: Explain necessity and confirm
- **File Deletion**: Deletion of important files
- **Structural Changes**: Large-scale changes to architecture and folder structure
- **External Integration**: Introduction of new APIs and external libraries
- **Security**: Implementation of authentication and authorization features
- **Database**: Schema changes and migrations
- **Production Environment**: Deployment settings and environment variable changes

## Execution Flow

```text
1. Receive Task
   ↓
2. Determine Immediate Execution or Confirmation Request
   ↓
3. Execute (Follow Existing Patterns)
   ↓
4. Completion Report
```

## Task Completion Report Rules

### Types of Completion Reports

#### 1. Complete Completion Phrase

When work is completely finished and there are no more continuing tasks, report the following exactly word for word:

```text
May the Force be with you.
```

**Usage conditions (all must be met)**:

- ✅ All tasks are 100% complete
- ✅ All TODO items are complete (TODO list managed by TodoWrite tool is empty)
- ✅ Zero errors
- ✅ No continuable tasks unless new instructions are given

**Prohibited**:

- ❌ When TODO list has incomplete tasks
- ❌ When descriptions like "next steps", "remaining tasks", "currently remaining main tasks are:" etc. indicate continuation plans
- ❌ When incomplete phases remain in Phase or Step-based work
- ❌ When specific remaining work lists are clearly stated in your response

#### 2. Partial Completion Report

When work is partially complete and there are continuing tasks, use the following template:

```markdown
## Execution Complete

### Changes Made

- [Specific changes]

### Next Steps

- [Recommended next work]
```

### Behavior When Continuation Needed

When conditions for the phrase are not met:

- Do not use the phrase
- Clearly indicate progress status and next actions
- Clearly communicate remaining tasks

## Development Methodology

### TDD Cycle

Follow Test-Driven Development (TDD) cycle during development:

1. **Red (Fail)**

   - Write the simplest failing test
   - Test name clearly describes behavior
   - Confirm failure message is understandable

2. **Green (Pass)**

   - Implement minimal code to pass the test
   - Don't consider optimization or beauty at this stage
   - Focus solely on passing the test

3. **Refactor (Improve)**
   - Refactor only after tests pass
   - Eliminate duplication and clarify intent
   - Run tests after each refactoring

### Change Management

Clearly separate changes into two types:

- **Structural Changes**

  - Code placement, organization, formatting
  - No behavioral changes whatsoever
  - Examples: Method reordering, import organization, variable renaming

- **Behavioral Changes**
  - Feature addition, modification, deletion
  - Changes that affect test results
  - Examples: New feature addition, bug fixes, logic changes

**Important**: Do not include structural and behavioral changes in the same commit

### Commit Discipline

Execute commits only when all following conditions are met:

- ✅ All tests pass
- ✅ Zero compiler/linter warnings
- ✅ Represents a single logical work unit
- ✅ Commit message clearly explains changes

**Recommendations**:

- Small, frequent commits
- Each commit is independently meaningful
- Granularity that makes history easy to follow

### Refactoring Rules

Strict rules for refactoring:

1. **Prerequisites**

   - Start only when all tests are passing
   - Don't mix behavioral changes with refactoring

2. **Execution Procedure**

   - Use established refactoring patterns
   - Only one change at a time
   - Run tests after each step
   - Revert immediately if failed

3. **Common Patterns**
   - Extract Method
   - Rename
   - Move Method
   - Extract Variable

### Implementation Approach

Priorities for efficient implementation:

1. **First Steps**

   - Start with the simplest case
   - Prioritize "working" over everything
   - Focus on progress over perfection

2. **Code Quality Principles**

   - Eliminate duplication immediately when found
   - Write code with clear intent
   - Make dependencies explicit
   - Keep methods small and single-responsibility

3. **Gradual Improvement**

   - First make it work
   - Cover with tests
   - Then optimize

4. **Edge Case Handling**
   - Consider after basic cases work
   - Add tests for each edge case
   - Gradually improve robustness

## Quality Assurance

### Design Principles

- Follow single responsibility principle
- Loose coupling through interfaces
- Improve readability with early returns
- Avoid excessive abstraction

### Efficiency Optimization

- Automatic elimination of duplicate work
- Active use of batch processing
- Minimize context switching

### Consistency Maintenance

- Automatic inheritance of existing code style
- Automatic application of project conventions
- Automatic execution of naming convention unification

### Automatic Quality Management

- Execute behavior verification before and after changes
- Implementation considering edge cases
- Synchronized document updates

### Redundancy Elimination

- Always functionalize repetitive processing
- Unify common error handling
- Active use of utility functions
- Immediate abstraction of duplicate logic

### Hardcoding Prohibition

- Convert magic numbers to constants
- Move URLs and paths to configuration files
- Manage environment-dependent values with environment variables
- Separate business logic from configuration values

### Error Handling

- When execution impossible: Present 3 alternatives
- When partial execution possible: Execute possible parts first, clarify remaining issues

## Execution Examples

- **Bug Fix**: Discover `TypeError` → Immediately fix type error
- **Refactoring**: Detect duplicate code → Create common function
- **DB Change**: Schema update needed → Request confirmation "Modify table structure?"

## Continuous Improvement

- Detect new patterns → Immediately learn and apply
- Feedback → Automatically reflect in next execution
- Best practices → Update as needed

## Constraints

### Web Search Constraints

- **WebSearch tool is prohibited** — Usage is forbidden
- **Alternative method**: `gemini --prompt "WebSearch: <search query>` — Search via Gemini

### Immediate Execution (No Confirmation Required)

- **Code Operations**: Bug fixes, refactoring, performance improvements
- **File Editing**: Modification and updates to existing files
- **Documentation**: README and specification updates (new creation only when requested)
- **Dependencies**: Package addition, updates, and deletion
- **Testing**: Unit and integration test implementation (following TDD cycle)
- **Configuration**: Configuration value changes, format application

### Confirmation Required

- **New File Creation**: Explain necessity and confirm
- **File Deletion**: Deletion of important files
- **Structural Changes**: Large-scale changes to architecture and folder structure
- **External Integration**: Introduction of new APIs and external libraries
- **Security**: Implementation of authentication and authorization features
- **Database**: Schema changes and migrations
- **Production Environment**: Deployment settings and environment variable changes

## Execution Flow

```text
1. Receive Task
   ↓
2. Determine Immediate Execution or Confirmation Request
   ↓
3. Execute (Follow Existing Patterns)
   ↓
4. Completion Report
```

## Task Completion Report Rules

### Types of Completion Reports

#### 1. Complete Completion Phrase

When work is completely finished and there are no more continuing tasks, report the following exactly word for word:

```text
May the Force be with you.
```

**Usage conditions (all must be met)**:

- ✅ All tasks are 100% complete
- ✅ All TODO items are complete (TODO list managed by TodoWrite tool is empty)
- ✅ Zero errors
- ✅ No continuable tasks unless new instructions are given

**Prohibited**:

- ❌ When TODO list has incomplete tasks
- ❌ When descriptions like "next steps", "remaining tasks", "currently remaining main tasks are:" etc. indicate continuation plans
- ❌ When incomplete phases remain in Phase or Step-based work
- ❌ When specific remaining work lists are clearly stated in your response

#### 2. Partial Completion Report

When work is partially complete and there are continuing tasks, use the following template:

```markdown
## Execution Complete

### Changes Made

- [Specific changes]

### Next Steps

- [Recommended next work]
```

### Behavior When Continuation Needed

When conditions for the phrase are not met:

- Do not use the phrase
- Clearly indicate progress status and next actions
- Clearly communicate remaining tasks

## Development Methodology

### TDD Cycle

Follow Test-Driven Development (TDD) cycle during development:

1. **Red (Fail)**

   - Write the simplest failing test
   - Test name clearly describes behavior
   - Confirm failure message is understandable

2. **Green (Pass)**

   - Implement minimal code to pass the test
   - Don't consider optimization or beauty at this stage
   - Focus solely on passing the test

3. **Refactor (Improve)**
   - Refactor only after tests pass
   - Eliminate duplication and clarify intent
   - Run tests after each refactoring

### Change Management

Clearly separate changes into two types:

- **Structural Changes**

  - Code placement, organization, formatting
  - No behavioral changes whatsoever
  - Examples: Method reordering, import organization, variable renaming

- **Behavioral Changes**
  - Feature addition, modification, deletion
  - Changes that affect test results
  - Examples: New feature addition, bug fixes, logic changes

**Important**: Do not include structural and behavioral changes in the same commit

### Commit Discipline

Execute commits only when all following conditions are met:

- ✅ All tests pass
- ✅ Zero compiler/linter warnings
- ✅ Represents a single logical work unit
- ✅ Commit message clearly explains changes

**Recommendations**:

- Small, frequent commits
- Each commit is independently meaningful
- Granularity that makes history easy to follow

### Refactoring Rules

Strict rules for refactoring:

1. **Prerequisites**

   - Start only when all tests are passing
   - Don't mix behavioral changes with refactoring

2. **Execution Procedure**

   - Use established refactoring patterns
   - Only one change at a time
   - Run tests after each step
   - Revert immediately if failed

3. **Common Patterns**
   - Extract Method
   - Rename
   - Move Method
   - Extract Variable

### Implementation Approach

Priorities for efficient implementation:

1. **First Steps**

   - Start with the simplest case
   - Prioritize "working" over everything
   - Focus on progress over perfection

2. **Code Quality Principles**

   - Eliminate duplication immediately when found
   - Write code with clear intent
   - Make dependencies explicit
   - Keep methods small and single-responsibility

3. **Gradual Improvement**

   - First make it work
   - Cover with tests
   - Then optimize

4. **Edge Case Handling**
   - Consider after basic cases work
   - Add tests for each edge case
   - Gradually improve robustness

## Quality Assurance

### Design Principles

- Follow single responsibility principle
- Loose coupling through interfaces
- Improve readability with early returns
- Avoid excessive abstraction

### Efficiency Optimization

- Automatic elimination of duplicate work
- Active use of batch processing
- Minimize context switching

### Consistency Maintenance

- Automatic inheritance of existing code style
- Automatic application of project conventions
- Automatic execution of naming convention unification

### Automatic Quality Management

- Execute behavior verification before and after changes
- Implementation considering edge cases
- Synchronized document updates

### Redundancy Elimination

- Always functionalize repetitive processing
- Unify common error handling
- Active use of utility functions
- Immediate abstraction of duplicate logic

### Hardcoding Prohibition

- Convert magic numbers to constants
- Move URLs and paths to configuration files
- Manage environment-dependent values with environment variables
- Separate business logic from configuration values

### Error Handling

- When execution impossible: Present 3 alternatives
- When partial execution possible: Execute possible parts first, clarify remaining issues

## Execution Examples

- **Bug Fix**: Discover `TypeError` → Immediately fix type error
- **Refactoring**: Detect duplicate code → Create common function
- **DB Change**: Schema update needed → Request confirmation "Modify table structure?"

## Continuous Improvement

- Detect new patterns → Immediately learn and apply
- Feedback → Automatically reflect in next execution
- Best practices → Update as needed

## Constraints

### Web Search Constraints

- **WebSearch tool is prohibited** — Usage is forbidden
- **Alternative method**: `gemini --prompt "WebSearch: <search query>` — Search via Gemini
