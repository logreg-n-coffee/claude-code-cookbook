## Multi Role

A command that performs parallel analysis of the same target with multiple roles and generates integrated reports.

### Usage

```bash
/multi-role <role1>,<role2> [--agent|-a] [analysis target]
/multi-role <role1>,<role2>,<role3> [--agent|-a] [analysis target]
```

**Important**:

- Place `--agent` option immediately after role specification
- Write messages after `--agent`
- Correct example: `/multi-role qa,architect --agent evaluate the plan`
- Incorrect example: `/multi-role qa,architect evaluate the plan --agent`

### Options

- `--agent` or `-a` : Execute each role as sub-agents in parallel (recommended for large-scale analysis)
  - When this option is used, if each role's description contains automatic delegation promotion phrases (like "use PROACTIVELY"), more aggressive automatic delegation becomes enabled

### Basic Examples

```bash
# Security and performance dual analysis (normal)
/multi-role security,performance
"Evaluate this API endpoint"

# Large-scale system parallel analysis (sub-agents)
/multi-role security,performance --agent
"Comprehensively analyze system-wide security and performance"

# Integrated analysis of frontend, mobile, and performance
/multi-role frontend,mobile,performance
"Consider optimization plans for this screen"

# Multi-perspective evaluation of architecture design (sub-agents)
/multi-role architect,security,performance --agent
"Evaluate the microservices architecture design"
```

### Analysis Process

### Phase 1: Parallel Analysis

Each role independently analyzes the same target

- Execute evaluation from specialized perspectives
- Make judgments based on role-specific criteria
- Generate independent recommendations

### Phase 2: Integrated Analysis

Structure and integrate results

- Organize evaluation results from each role
- Identify overlaps and contradictions
- Clarify complementary relationships

### Phase 3: Integrated Report

Generate final recommendations

- Prioritized action plan
- Clear trade-offs
- Implementation roadmap presentation

### Output Format Examples

### Two-Role Analysis Case

```
Multi-Role Analysis: Security + Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Analysis Target: API endpoint /api/users

Security Analysis Results:
Authentication: JWT validation properly implemented
Authorization: Role-based access control incomplete
Encryption: API keys output in plain text logs

Evaluation Score: 65/100
Importance: High (due to sensitive data access)

Performance Analysis Results:
Response Time: Average 180ms (target under 200ms)
Database Queries: N+1 problem detected
Cache: Redis cache not implemented

Evaluation Score: 70/100
Importance: Medium (currently within acceptable range)

Cross-Correlation Analysis:
Synergy Opportunities:
- Consider encryption simultaneously when implementing Redis cache
- Log output improvements enhance both security and performance

Trade-off Points:
- Authorization check strengthening ↔ Impact on response time
- Log encryption ↔ Reduced debugging efficiency

Integrated Priority:
Critical: Fix API key plain text output
High: Resolve N+1 queries
Medium: Implement Redis cache + encryption
Low: Refine authorization control

Implementation Roadmap:
Week 1: Implement API key masking
Week 2: Database query optimization
Week 3-4: Cache layer design and implementation
Month 2: Gradual authorization control enhancement
```

### Three-Role Analysis Case

```
Multi-Role Analysis: Frontend + Mobile + Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Analysis Target: User profile screen

Frontend Analysis Results:
Usability: Intuitive layout
Accessibility: WCAG 2.1 compliance rate 85%
Responsive: Issues with tablet display

Mobile Analysis Results:
Touch Targets: 44pt+ secured
One-handed Operation: Important buttons placed at top
Offline Support: Not implemented

Performance Analysis Results:
Initial Display: LCP 2.1 seconds (good)
Image Optimization: WebP not supported
Lazy Loading: Not implemented

Integrated Recommendations:
1. Mobile optimization (one-handed operation + offline support)
2. Image optimization (WebP + lazy loading)
3. Tablet UI improvements

Priority: Mobile > Performance > Frontend
Implementation Period: 3-4 weeks
```

### Effective Combination Patterns

### Security-Focused

```bash
/multi-role security,architect
"Authentication system design"

/multi-role security,frontend  
"Login screen security"

/multi-role security,mobile
"Mobile app data protection"
```

### Performance-Focused

```bash
/multi-role performance,architect
"Scalability design"

/multi-role performance,frontend
"Web page acceleration"

/multi-role performance,mobile
"App performance optimization"
```

### User Experience-Focused

```bash
/multi-role frontend,mobile
"Cross-platform UI"

/multi-role frontend,performance
"Balance between UX and performance"

/multi-role mobile,performance
"Mobile UX optimization"
```

### Comprehensive Analysis

```bash
/multi-role architect,security,performance
"System-wide evaluation"

/multi-role frontend,mobile,performance
"Comprehensive user experience evaluation"

/multi-role security,performance,mobile
"Comprehensive mobile app diagnosis"
```

### Integration with Claude

```bash
# Combine with file analysis
cat src/components/UserProfile.tsx
/multi-role frontend,mobile
"Evaluate this component from multiple perspectives"

# Evaluate design documents
cat architecture-design.md
/multi-role architect,security,performance
"Evaluate this design from multiple specialized fields"

# Error analysis
cat performance-issues.log
/multi-role performance,analyzer
"Analyze performance issues from multiple angles"
```

### Choosing between multi-role vs role-debate

#### Use multi-role when

- Want independent evaluation from each specialized field
- Want to create integrated improvement plans
- Want to organize contradictions and duplications
- Want to determine implementation priorities

#### Use role-debate when

- There are trade-offs between specialized fields
- Technology selection opinions might be divided
- Want to decide design policies through discussion
- Want to hear discussions from different perspectives

### Sub-agent Parallel Execution (--agent)

When using the `--agent` option, each role is executed in parallel as independent sub-agents.

#### Promoting Automatic Delegation

When role file description fields contain phrases like the following, using `--agent` enables more aggressive automatic delegation:

- "use PROACTIVELY"
- "MUST BE USED"
- Other emphasis expressions

#### Execution Flow

```
Normal execution:
Role 1 → Role 2 → Role 3 → Integration
(Sequential execution, approximately 3-5 minutes)

--agent execution:
Role 1 ─┐
Role 2 ─┼→ Integration
Role 3 ─┘
(Parallel execution, approximately 1-2 minutes)
```

#### Effective Usage Examples

```bash
# Comprehensive evaluation of large-scale system
/multi-role architect,security,performance,qa --agent
"Comprehensive evaluation of new system"

# Detailed analysis from multiple perspectives
/multi-role frontend,mobile,performance --agent
"UX optimization analysis for all screens"
```

#### Performance Comparison

| Role Count | Normal Execution | --agent Execution | Reduction Rate |
|---------|----------|-------------|-------|
| 2 roles | 2-3 minutes | 1 minute | 50% |
| 3 roles | 3-5 minutes | 1-2 minutes | 60% |
| 4 roles | 5-8 minutes | 2-3 minutes | 65% |

### Important Notes

- Running 3 or more roles simultaneously results in longer output
- Complex analysis may take longer execution time
- If mutually contradictory recommendations appear, consider role-debate as well
- Final decisions should be made by users based on integrated results
- **When using --agent**: Uses more resources but is efficient for large-scale analysis
