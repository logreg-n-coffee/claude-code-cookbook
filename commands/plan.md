## Plan

Activate pre-implementation planning mode to develop detailed implementation strategies. Support efficient development by creating structured plans before code implementation.

### Usage

```bash
# Request Plan Mode from Claude
"Create implementation plan for [implementation content]"
```

### Basic Examples

```bash
# New feature implementation plan
"Create implementation plan for user authentication feature"

# System design plan
"Create implementation plan for microservice separation"

# Refactoring plan
"Create implementation plan for legacy code refactoring"
```

### Claude Integration

```bash
# Complex feature implementation
"Create implementation plan for chat functionality. Include WebSocket, real-time notifications, and history management"

# Database design
"Create database design plan for EC site. Include product, order, and user management"

# API design
"Create implementation plan for GraphQL API. Include authentication, caching, and rate limiting"

# Infrastructure design
"Create implementation plan for Dockerization. Include development environment, production environment, and CI/CD"
```

### Plan Mode Features

**Auto Activation**

- Plan Mode automatically activates when implementation tasks are detected
- Can be explicitly activated with keywords like "create implementation plan"

**Structured Specifications**

- Requirements definition (user stories, acceptance criteria)
- Design documents (architecture, data design, UI design)
- Implementation plan (task breakdown, progress tracking, quality assurance)
- Risk analysis and countermeasures

**Approval Process**

- Present plan with `exit_plan_mode` tool
- **Important**: Always wait for explicit user approval regardless of tool return value
- Starting implementation without approval is prohibited
- Plan modification and adjustment possible
- Start task management with TodoWrite only after approval

### Detailed Examples

```bash
# Complex system implementation
"Create implementation plan for online payment system. Include Stripe integration, security, and error handling"

# Frontend implementation
"Create implementation plan for React dashboard. Include state management, component design, and testing"

# Backend implementation
"Create implementation plan for RESTful API. Include authentication, validation, and logging"

# DevOps implementation
"Create implementation plan for CI/CD pipeline. Include test automation, deployment, and monitoring"
```

### 3-Phase Workflow

#### Phase 1: Requirements

- **User Stories**: Clarify purpose and value of features
- **Acceptance Criteria**: Define completion conditions and quality standards
- **Constraints & Assumptions**: Organize technical and temporal constraints
- **Prioritization**: Classify Must-have/Nice-to-have

#### Phase 2: Design

- **Architecture Design**: System configuration and technology selection
- **Data Design**: Schema, API specifications, data flow
- **UI/UX Design**: Screen configuration and operation flow
- **Risk Analysis**: Potential problems and countermeasures

#### Phase 3: Implementation

- **Task Breakdown**: Subdivision into implementable units
- **Progress Tracking**: State management with TodoWrite
- **Quality Assurance**: Test strategy and verification methods
- **Approval Process**: Plan presentation with exit_plan_mode and explicit approval waiting

### Notes

**Scope of Application**

- Plan Mode is optimal for complex implementation tasks
- Use normal implementation format for simple fixes or small-scale changes
- Recommended for work with 3+ steps or new feature development

**Technical Constraints**

- Do not trust return values from `exit_plan_mode` tool
- Judge approval process by user's explicit intent
- Different functionality from CLI plan mode

**Execution Notes**

- Starting implementation before approval strictly prohibited
- Always wait for user response after plan presentation
- Provide alternatives in case of errors

### Execution Example

```bash
# Usage example
"Create implementation plan for user management system"

# Expected behavior
# 1. Plan Mode auto-activates
# 2. Requirements analysis and technology selection
# 3. Structured implementation steps
# 4. Present plan with exit_plan_mode
# 5. Start implementation after approval
```
