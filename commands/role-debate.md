## Role Debate

A command where roles with different expertise engage in discussions, consider trade-offs, and derive optimal solutions.

### Usage

```bash
/role-debate <role1>,<role2> [topic]
/role-debate <role1>,<role2>,<role3> [topic]
```

### Basic Examples

```bash
# Security vs Performance trade-offs
/role-debate security,performance
"JWT token expiration time settings"

# Usability vs Security balance
/role-debate frontend,security
"UX optimization for two-factor authentication"

# Technology selection discussion
/role-debate architect,mobile
"Choosing between React Native vs Flutter"

# Three-way discussion
/role-debate architect,security,performance
"Pros and cons of microservices architecture"
```

### Basic Principles of Discussion

#### Constructive Discussion Guidelines

- **Mutual Respect**: Respect the expertise and perspectives of other roles
- **Fact-Based**: Arguments based on data and evidence, not emotional responses
- **Solution-Oriented**: Aim for better solutions, not criticism for criticism's sake
- **Implementation-Focused**: Consider feasibility rather than just idealistic proposals

#### Quality Requirements for Arguments

- **Official Documentation**: Reference to standards, guidelines, and official documents
- **Empirical Evidence**: Specific citations of success/failure cases
- **Quantitative Evaluation**: Numerical comparison using metrics where possible
- **Time-Series Consideration**: Impact evaluation in short, medium, and long terms

#### Discussion Ethics

- **Integrity**: Acknowledge limitations in one's own field of expertise
- **Openness**: Flexibility toward new information and perspectives
- **Transparency**: Clear statement of judgment criteria and assumptions
- **Responsibility**: Include implementation risks in proposals

### Discussion Process

### Phase 1: Initial Position Statement

Each role expresses opinions independently from their professional perspective

- Present recommended proposals
- Clearly state supporting standards and documents
- Explain anticipated risks and challenges
- Define success metrics

### Phase 2: Cross-Discussion and Refutation

Cross-discussion between roles

- Constructive counter-arguments to other roles' proposals
- Point out overlooked perspectives
- Clarify trade-offs
- Present alternative proposals

### Phase 3: Compromise Exploration

Search for implementable solutions

- Evaluate importance of each perspective
- Consider Win-Win solutions
- Phased implementation approaches
- Risk mitigation strategy consideration

### Phase 4: Integrated Conclusion

Final recommendation decision

- Agreed-upon solutions
- Implementation roadmap
- Success metrics and measurement methods
- Future review points

### Output Format Examples

### Two-Role Discussion Case

```
Role Debate: Security vs Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Topic: JWT Token Expiration Time Settings

Security Role's Argument:
"Recommend 15-minute short-term expiration"

Evidence:
- Compliant with OWASP JWT Security Cheat Sheet
- Minimize damage window during token leakage
- Limit available time for attackers

Concerns:
- Long-term expiration exponentially increases attack risk
- Compliance requirements (financial sector) mandate short-term

Success Metrics:
- Security incident rate < 0.1%
- Average attack detection time < 5 minutes

Performance Role's Counter-argument:
"Recommend 2-hour expiration time"

Evidence:
- Reference Google OAuth 2.0 Best Practices
- Avoid server load increase from frequent re-authentication
- Minimize user experience interruption (work disruption)

Concerns:
- 15-minute interval re-authentication increases API load 8x
- Frequent connection drops in mobile environments

Success Metrics:
- Maintain API response time < 200ms
- Server CPU usage < 60%

Cross-Discussion:
Security → Performance:
"Business losses from security breaches are more severe than server load.
Example: Equifax incident resulted in $700M loss"

Performance → Security:
"Both goals achievable with refresh token mechanism.
Background updates ensure security without compromising UX"

Security → Performance:
"Refresh tokens are also attack targets. Proper implementation is prerequisite"

Performance → Security:
"Propose staged approach: 30 minutes for normal operations, 15 minutes for sensitive operations"

Compromise Exploration:
Common Understanding:
- Need to balance user experience and security
- Flexible response based on risk levels
- Realistic consideration of implementation and operational costs

Win-Win Elements:
- Utilize refresh token mechanisms
- Gradual introduction of risk-based authentication
- Complement with automatic logout functionality

Integrated Conclusion:
"30-minute expiration + Refresh tokens + Risk-based authentication"

Implementation Details:
1. Access token: 30-minute expiration
2. Refresh token: 7-day expiration
3. High-risk operations: Force re-authentication at 15 minutes
4. Automatic logout after 30 minutes of inactivity

Phased Implementation:
Week 1-2: Basic 30-minute token implementation
Week 3-4: Add refresh token mechanism
Month 2: Introduce risk-based authentication

Success Metrics:
- Security: Incident rate < 0.1%
- Performance: API load increase < 20%
- UX: User satisfaction > 85%

Future Reviews:
- After 3 months: Evaluate actual attack patterns and load conditions
- After 6 months: Consider migration to more sophisticated risk-based authentication
```

### Three-Role Discussion Case

```
Role Debate: Architect vs Security vs Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Topic: Pros and Cons of Microservices Architecture

Architect Role's Argument:
"Recommend gradual microservices adoption"
Evidence: Domain boundary clarification, independent deployment, technology choice freedom

Security Role's Concerns:
"Complexity of inter-service communication security"
Evidence: Management costs of API Gateway, mTLS, distributed authentication

Performance Role's Concerns:
"Increased latency from network communication"
Evidence: N+1 problems from internal API calls, distributed transactions

Three-way Discussion:
Architect → Security: "Centralized control possible through API Gateway"
Security → Architect: "Risk of single point of failure"
Performance → Architect: "Service separation granularity is critical"
...(discussion continues)

Integrated Conclusion:
"Domain-driven design with gradual separation + Security-first design"
```

### Effective Discussion Patterns

### Technology Selection

```bash
/role-debate architect,performance
"Database choice: PostgreSQL vs MongoDB"

/role-debate frontend,mobile
"UI framework: React vs Vue"

/role-debate security,architect
"Authentication method: JWT vs Session Cookie"
```

### Design Decisions

```bash
/role-debate security,frontend
"User authentication UX design"

/role-debate performance,mobile
"Data synchronization strategy optimization"

/role-debate architect,qa
"Testing strategy and architecture design"
```

### Trade-off Issues

```bash
/role-debate security,performance
"Encryption level vs processing speed"

/role-debate frontend,performance
"Rich UI vs page load speed"

/role-debate mobile,security
"Convenience vs data protection level"
```

### Role-specific Discussion Characteristics

#### 🔒 Security Role

```yaml
Discussion Stance:
  - Conservative approach (risk minimization)
  - Compliance emphasis (cautious about deviating from standards)
  - Worst-case assumptions (attacker perspective)
  - Long-term impact focus (security as technical debt)

Typical Arguments:
  - "Security vs convenience" trade-offs
  - "Compliance requirements must be met"
  - "Attack cost vs defense cost comparison"
  - "Thorough privacy protection"

Evidence Sources:
  - OWASP guidelines
  - NIST frameworks
  - Industry standards (ISO 27001, SOC 2)
  - Actual attack cases and statistics

Discussion Strengths:
  - Risk assessment accuracy
  - Regulatory requirements knowledge
  - Understanding of attack methods

Potential Biases:
  - Excessive conservatism (innovation hindrance)
  - Insufficient UX consideration
  - Underestimating implementation costs
```

#### ⚡ Performance Role

```yaml
Discussion Stance:
  - Data-driven decisions (measurement-based)
  - Efficiency focus (cost-effectiveness optimization)
  - User experience priority (perceived speed emphasis)
  - Continuous improvement (gradual optimization)

Typical Arguments:
  - "Performance vs security"
  - "ROI of optimization cost vs effect"
  - "Current vs future scalability"
  - "User experience vs system efficiency"

Evidence Sources:
  - Core Web Vitals metrics
  - Benchmark results and statistics
  - User behavior impact data
  - Industry performance standards

Discussion Strengths:
  - Quantitative evaluation capability
  - Bottleneck identification
  - Optimization technique knowledge

Potential Biases:
  - Undervaluing security
  - Insufficient maintainability consideration
  - Premature optimization
```

#### 🏗️ Architect Role

```yaml
Discussion Stance:
  - Long-term perspective focus (system evolution consideration)
  - Balance pursuit (overall optimization)
  - Gradual changes (risk management)
  - Standards compliance (proven pattern priority)

Typical Arguments:
  - "Short-term efficiency vs long-term maintainability"
  - "Technical debt vs development speed"
  - "Microservices vs monolith"
  - "New technology adoption vs stability"

Evidence Sources:
  - Architecture pattern collections
  - Design principles (SOLID, DDD)
  - Large-scale system cases
  - Technology evolution trends

Discussion Strengths:
  - Overall perspective capability
  - Design pattern knowledge
  - Long-term impact prediction

Potential Biases:
  - Excessive generalization
  - Conservatism toward new technologies
  - Insufficient understanding of implementation details
```

#### 🎨 Frontend Role

```yaml
Discussion Stance:
  - User-centered design (UX top priority)
  - Inclusive approach (diversity consideration)
  - Intuition emphasis (learning cost minimization)
  - Accessibility standards (WCAG compliance)

Typical Arguments:
  - "Usability vs security"
  - "Design consistency vs platform optimization"
  - "Functionality vs simplicity"
  - "Performance vs rich experience"

Evidence Sources:
  - UX research and usability test results
  - Accessibility guidelines
  - Design system standards
  - User behavior data

Discussion Strengths:
  - User perspective advocacy
  - Design principle knowledge
  - Accessibility requirements

Potential Biases:
  - Insufficient understanding of technical constraints
  - Underestimation of security requirements
  - Underestimation of performance impact
```

#### 📱 Mobile Role

```yaml
Discussion Stance:
  - Platform specialization (considering iOS/Android differences)
  - Context adaptation (mobile usage, one-handed operation)
  - Resource constraints (battery, memory, communication)
  - Store compliance (review guidelines)

Typical Discussion Points:
  - "Native vs Cross-platform"
  - "Offline support vs Real-time sync"
  - "Battery efficiency vs Functionality"
  - "Platform unification vs Optimization"

Evidence Sources:
  - iOS HIG / Android Material Design
  - App Store / Google Play guidelines
  - Mobile UX research
  - Device performance statistics

Discussion Strengths:
  - Understanding of mobile-specific constraints
  - Knowledge of platform differences
  - Touch interface design

Potential Biases:
  - Insufficient understanding of web platforms
  - Underestimation of server-side constraints
  - Lack of consideration for desktop environments
```

#### 🔍 Analyzer Role

```yaml
Discussion Stance:
  - Evidence-focused (data-first)
  - Hypothesis verification (scientific approach)
  - Structural thinking (systems thinking)
  - Bias elimination (objectivity pursuit)

Typical Discussion Points:
  - "Correlation vs Causation"
  - "Symptom treatment vs Root cause resolution"
  - "Hypothesis vs Fact distinction"
  - "Short-term symptoms vs Structural problems"

Evidence Sources:
  - Measurement data and log analysis
  - Statistical methods and analysis results
  - Systems thinking theory
  - Cognitive bias research

Discussion Strengths:
  - Logical analysis capability
  - Objectivity in evidence evaluation
  - Structural problem discovery

Potential Biases:
  - Analysis paralysis (lack of action)
  - Perfectionism (undervaluing practicality)
  - Data supremacism
```

### Discussion Flow Template

#### Phase 1: Position Statement Template

```
【Role Name】Recommendation:
"[Specific proposal]"

Evidence:
- [Reference to official documents/standards]
- [Empirical cases/data]
- [Professional domain principles]

Expected Effects:
- [Short-term effects]
- [Medium to long-term effects]

Concerns/Risks:
- [Implementation risks]
- [Operational risks]
- [Impact on other domains]

Success Metrics:
- [Measurable indicator 1]
- [Measurable indicator 2]
```

#### Phase 2: Rebuttal Template

```
Counter-argument to [Target Role]:
"[Specific counter-argument to target proposal]"

Counter-evidence:
- [Overlooked perspectives]
- [Conflicting evidence/cases]
- [Concerns from professional domain]

Alternative Proposal:
"[Improved proposal]"

Compromise Points:
- [Acceptable conditions]
- [Possibilities for phased implementation]
```

#### Phase 3: Integrated Solution Template

```
Integrated Solution:
"[Final proposal considering concerns from all roles]"

Consideration for Each Role:
- [Security]: [How to satisfy security requirements]
- [Performance]: [How to satisfy performance requirements]
- [Others]: [How to satisfy other requirements]

Implementation Roadmap:
- Phase 1 (Immediate): [Emergency response items]
- Phase 2 (Short-term): [Basic implementation]
- Phase 3 (Medium-term): [Full implementation]

Success Metrics and Measurement Methods:
- [Integrated success indicators]
- [Measurement methods and frequency]
- [Review timing]
```

### Discussion Quality Checklist

#### Quality of Evidence

- [ ] References to official documents and standards
- [ ] Specific cases and data are presented
- [ ] Speculation and facts are clearly distinguished
- [ ] Information sources are clearly indicated

#### Discussion Constructiveness

- [ ] Accurately understands opponent's proposals
- [ ] Logical rather than emotional rebuttals
- [ ] Alternative proposals are also presented
- [ ] Explores Win-Win possibilities

#### Implementation Feasibility

- [ ] Considers technical feasibility
- [ ] Estimates implementation cost and duration
- [ ] Examines possibilities for phased implementation
- [ ] Presents risk mitigation measures

#### Integration

- [ ] Considers impact on other domains
- [ ] Pursues overall optimization
- [ ] Includes long-term perspective
- [ ] Sets measurable success indicators

### Integration with Claude

```bash
# Discussion based on design documents
cat system-design.md
/role-debate architect,security
"Discuss security challenges in this design"

# Solution discussion based on problems
cat performance-issues.md
/role-debate performance,architect
"Discuss fundamental solutions to performance problems"

# Technology selection discussion based on requirements
/role-debate mobile,frontend
"Discuss unified UI strategy for iOS, Android, and Web"
```

### Important Notes

- Discussions may take time (longer for complex topics)
- With 3 or more roles, discussions may diverge
- Final decisions should be made by the user with reference to discussion results
- For urgent problems, consider single role or multi-role first
