## Task

Launch dedicated agents to autonomously execute complex search, investigation, and analysis tasks. Large-scale information processing combining multiple tools with emphasis on context efficiency.

### Usage

```bash
# Request Task from Claude
"Please investigate [issue] with Task"
```

### Task Features

**Autonomous Execution**

- Automatic execution combining multiple tools
- Gradual information collection and analysis
- Result integration and structured reporting

**Efficient Information Processing**

- Context consumption optimization
- Large-scale file search and analysis
- Data collection from external information sources

**Quality Assurance**

- Information source reliability checking
- Verification from multiple perspectives
- Automatic completion of missing information

### Basic Examples

```bash
# Complex codebase investigation
"Please investigate which files implement this feature using Task"

# Large-scale file search
"Please identify configuration file inconsistencies using Task"

# External information collection
"Please investigate latest AI technology trends using Task"
```

### Claude Integration

```bash
# Complex problem analysis
"Please analyze the cause of memory leaks using Task. Include profiling results and logs"

# Dependency investigation
"Please investigate vulnerabilities in this npm package using Task"

# Competitive analysis
"Please investigate competitor service API specifications using Task"

# Architecture analysis
"Please analyze the dependencies of this microservice using Task"
```

### Distinguishing from Other Commands

#### Task vs Other Commands

| Command | Main Use | Execution Method | Information Collection |
|---------|----------|------------------|----------------------|
| **Task** | Investigation, analysis, search | Autonomous execution | Multiple sources |
| ultrathink | Deep thinking, judgment | Structured thinking | Existing knowledge focused |
| sequential-thinking | Problem solving, design | Staged thinking | As needed |
| plan | Implementation planning | Approval process | Requirements analysis |

#### Decision Flowchart

```
Information collection needed?
├─ Yes → Multiple sources, large scale?
│          ├─ Yes → **Task**
│          └─ No → Regular question
└─ No → Deep thinking needed?
          ├─ Yes → ultrathink/sequential-thinking
          └─ No → Regular question
```

### Effective Cases / Unnecessary Cases

#### Effective Cases

- Complex codebase investigation (dependencies, architecture analysis)
- Large-scale file search (specific implementation patterns, configuration files)
- External information collection and organization (technology trends, library research)
- Information integration from multiple sources (log analysis, metrics analysis)
- Repetitive investigation tasks (security audits, technical debt research)
- Large-scale analysis where context consumption should be avoided

#### Unnecessary Cases

- Simple questions or content answerable with existing knowledge
- One-time tasks that complete quickly
- Tasks requiring interactive confirmation or consultation
- Implementation or design decisions (plan or thinking commands are appropriate)

### Detailed Examples by Category

#### System Analysis & Investigation

```bash
# Complex system analysis
"Identify e-commerce site bottlenecks using Task. Investigate database, API, and frontend comprehensively"

# Architecture analysis
"Analyze microservice dependencies using Task. Include API communication and data flow"

# Technical debt research
"Analyze legacy code technical debt using Task. Include refactoring priorities"
```

#### Security & Compliance

```bash
# Security audit
"Investigate application vulnerabilities using Task. Based on OWASP Top 10"

# License investigation
"Investigate license issues in project dependencies using Task"

# Configuration file audit
"Identify security configuration inconsistencies using Task. Include differences between environments"
```

#### Performance & Optimization

```bash
# Performance analysis
"Identify heavy queries in the application using Task. Include execution plans and optimization suggestions"

# Resource usage investigation
"Investigate causes of memory leaks using Task. Include profiling results and code analysis"

# Bundle size analysis
"Investigate frontend bundle size issues using Task. Include optimization suggestions"
```

#### External Information Collection

```bash
# Technology trend research
"Research JavaScript framework trends in 2024 using Task"

# Competitive analysis
"Research competitor service API specifications using Task. Include feature comparison table"

# Library evaluation
"Research state management library comparisons using Task. Include performance and learning costs"
```

### Execution Flow and Quality Assurance

#### Task Execution Flow

```
1. Initial Analysis
   ├─ Problem decomposition and investigation scope identification
   ├─ Selection of necessary tools and information sources
   └─ Execution plan formulation

2. Information Collection
   ├─ File search and code analysis
   ├─ External information collection
   └─ Data structuring

3. Analysis & Integration
   ├─ Relationship analysis of collected information
   ├─ Pattern and issue identification
   └─ Hypothesis verification

4. Reporting & Proposals
   ├─ Result structuring
   ├─ Improvement proposal creation
   └─ Next action presentation
```

#### Quality Assurance

- **Information Source Reliability Check**: Fact verification with multiple sources
- **Completeness Verification**: Check for gaps in investigation targets
- **Consistency Verification**: Confirm consistency of contradictory information
- **Practicality Assessment**: Evaluate feasibility and effectiveness of proposals

### Error Handling and Constraints

#### Common Constraints

- **External API Usage Limits**: Rate limits or authentication errors
- **Large File Processing Limits**: Memory or timeout constraints
- **Access Permission Issues**: File or directory access restrictions

#### Error Response

- **Partial Result Reporting**: Analysis with only available information
- **Alternative Method Suggestions**: Alternative investigation methods under constraints
- **Staged Execution**: Divided execution of large-scale tasks

### Notes

- Task is optimal for complex and autonomous investigation/analysis tasks
- For simple questions or cases requiring immediate answers, use regular question format
- Treat investigation results as reference information and always verify important decisions
- When collecting external information, pay attention to information freshness and accuracy

### Execution Example

```bash
# Usage example
"Investigate GraphQL schema issues using Task"

# Expected behavior
# 1. Dedicated agent launches
# 2. Search for GraphQL-related files
# 3. Schema definition analysis
# 4. Comparison with best practices
# 5. Issue identification and improvement suggestions
# 6. Structured report creation
```
