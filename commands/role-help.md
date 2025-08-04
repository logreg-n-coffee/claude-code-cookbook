## Role Help

A selection guide and help system for when you're unsure which role to use.

### Usage

```bash
/role-help                      # General role selection guide
/role-help <situation/problem>  # Recommended roles for specific situations
/role-help compare <role1>,<role2> # Role comparison
```

### Basic Examples

```bash
# General guidance
/role-help
→ Display list of available roles and their characteristics

# Situation-specific recommendations
/role-help "Concerned about API security"
→ Recommend security role and usage method

# Role comparison
/role-help compare frontend,mobile
→ Differences and use cases for frontend vs mobile
```

### Situation-Specific Role Selection Guide

#### 🔒 Security-Related

```
Use security role when you have:
✅ Login and authentication feature implementation
✅ API security vulnerability checks
✅ Data encryption and privacy protection
✅ Security compliance verification
✅ Intrusion testing and penetration testing

Usage: /role security
```

#### 🏗️ Architecture & Design

```
Use architect role when you have:
✅ System-wide design evaluation
✅ Microservices vs monolith decisions
✅ Database design and technology selection
✅ Scalability and extensibility considerations
✅ Technical debt evaluation and improvement planning

Usage: /role architect
```

#### ⚡ Performance Issues

```
Use performance role when you have:
✅ Slow application performance
✅ Database query optimization
✅ Web page loading speed improvements
✅ Memory and CPU usage optimization
✅ Scaling and load handling

Usage: /role performance
```

#### 🔍 Problem Investigation

```
Use analyzer role when you have:
✅ Bug and error root cause analysis
✅ System failure cause investigation
✅ Structural analysis of complex problems
✅ Data analysis and statistical investigation
✅ Understanding why problems occurred

Usage: /role analyzer
```

#### 🎨 Frontend & UI/UX

```
Use frontend role when you have:
✅ User interface improvements
✅ Accessibility compliance
✅ Responsive design
✅ Usability and ease-of-use improvements
✅ Web frontend technology in general

Usage: /role frontend
```

#### 📱 Mobile App Development

```
Use mobile role when you have:
✅ iOS and Android app optimization
✅ Mobile-specific UX design
✅ Touch interface optimization
✅ Offline support and sync functionality
✅ App Store and Google Play compliance

Usage: /role mobile
```

#### 👀 Code Review & Quality

```
Use reviewer role when you have:
✅ Code quality checks
✅ Readability and maintainability evaluation
✅ Coding standard verification
✅ Refactoring suggestions
✅ PR and commit reviews

Usage: /role reviewer
```

#### 🧪 Testing & Quality Assurance

```
Use qa role when you have:
✅ Test strategy planning
✅ Test coverage evaluation
✅ Automated testing implementation policies
✅ Bug prevention and quality improvement
✅ CI/CD test automation

Usage: /role qa
```

### When Multiple Roles Are Needed

#### 🔄 multi-role (Parallel Analysis)

```
Use multi-role when you have:
✅ Want evaluation from multiple expert perspectives
✅ Want to create integrated improvement plans
✅ Want to compare evaluations from different fields
✅ Want to organize contradictions and overlaps

Example: /multi-role security,performance
```

#### 🗣️ role-debate (Discussion)

```
Use role-debate when you have:
✅ Trade-offs between specialized fields
✅ Technology selection opinions are divided
✅ Want to decide design policies through discussion
✅ Want to hear discussions from different perspectives

Example: /role-debate security,performance
```

#### 🤖 smart-review (Automated Suggestions)

```
Use smart-review when you have:
✅ Don't know which role to use
✅ Want to know the optimal approach for current situation
✅ Want to choose from multiple options
✅ Are a beginner and unsure about decisions

Example: /smart-review
```

### Role Comparison Table

#### Security Systems

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| security | Vulnerability & attack countermeasures | Threat analysis, authentication design | UX, performance |
| analyzer | Root cause analysis | Logical analysis, evidence collection | Prevention measures, future planning |

#### Design Systems

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| architect | System design | Long-term perspective, overall optimization | Implementation details, short-term solutions |
| reviewer | Code quality | Implementation level, maintainability | Business requirements, UX |

#### Performance Systems

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| performance | Acceleration & optimization | Measurement, bottlenecks | Security, UX |
| qa | Quality assurance | Testing, automation | Design, architecture |

#### User Experience Systems

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| frontend | Web UI/UX | Browser, accessibility | Server-side, DB |
| mobile | Mobile UX | Touch, offline support | Server-side, Web |

### Decision Flowchart When Unsure

```
What is the nature of the problem?
├─ Security-related → security
├─ Performance issues → performance  
├─ Bug/failure investigation → analyzer
├─ UI/UX improvement → frontend or mobile
├─ Design/architecture → architect
├─ Code quality → reviewer
├─ Testing-related → qa
└─ Complex/composite → smart-review for suggestions

Does it span multiple fields?
├─ Want integrated analysis → multi-role
├─ Discussion/trade-offs → role-debate
└─ Unsure about decision → smart-review
```

### Frequently Asked Questions

#### Q: What's the difference between frontend and mobile?

```
A: 
frontend: Web browser-focused, HTML/CSS/JavaScript
mobile: Mobile app-focused, iOS/Android native, React Native, etc.

For cases involving both, multi-role frontend,mobile is recommended
```

#### Q: How to choose between security and analyzer?

```
A:
security: Attack/threat prevention, security design
analyzer: Root cause analysis of problems that already occurred, investigation

For security incident investigation, use multi-role security,analyzer
```

#### Q: What's the difference between architect and performance?

```
A:
architect: Long-term design of overall system, scalability
performance: Specific speed and efficiency improvements

For performance design of large-scale systems, use multi-role architect,performance
```

### Integration with Claude

```bash
# Combine with situation description
/role-help
"React app page loading is slow and users are complaining"

# Combine with file content
cat problem-description.md
/role-help
"Recommend the optimal role for this problem"

# When unsure about specific choices
/role-help compare security,performance
"Which role is appropriate for JWT token expiration issues?"
```

### Important Notes

- Complex problems are more effective when combining multiple roles
- Use single role for quick response when urgency is high
- When unsure, we recommend receiving automated suggestions with smart-review
- Final decisions should be made by users considering the nature of the problem
