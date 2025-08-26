## Check Prompt

A comprehensive best practices collection for evaluating and improving prompt quality for AI agents. Systematizes insights gained from actual prompt improvement processes, covering all critical aspects including ambiguity elimination, information integration, enforcement strengthening, tracking systems, and continuous improvement.

### Usage

```bash
# Check prompt file quality
cat your-prompt.md
/check-prompt
"Check the quality of this prompt and provide improvement suggestions"
```

### Options

- None : Analyze current file or selected text
- `--category <name>` : Check only specific category (structure/execution/restrictions/quality/roles/improvement)
- `--score` : Calculate quality score only
- `--fix` : Auto-suggest fixes for detected issues
- `--deep` : Deep analysis mode (focus on ambiguity, information scatter, enforcement)

### Basic Examples

```bash
# Quality evaluation of entire prompt
cat devin/playbooks/code-review.md
/check-prompt
"Evaluate this prompt quality across 6 categories and provide issues and improvement suggestions"

# Deep analysis mode
/check-prompt --deep
"Focus on ambiguity, information scatter, and insufficient enforcement to provide fundamental improvement suggestions"

# Check specific category
/check-prompt --category structure
"Check this prompt from structure and clarity perspective"

# Detect and fix ambiguous expressions
/check-prompt --fix
"Detect ambiguous expressions and suggest clear expression fixes"
```

---

## Core Design Principles

### Principle 1: Completely Eliminate Room for Interpretation

- **Absolutely Prohibited**: "As a rule", "recommended", "if possible", "depending on situation", "judge appropriately"
- **Must Use**: "Must", "absolutely", "strictly adhere", "without exception", "mandatory"
- **Exception Conditions**: Strictly limited by numbers ("only the following 3 conditions", "except for these 2 cases")

### Principle 2: Strategic Information Integration

- Completely integrate related important information into one section
- Summarize the overall picture in execution checklists
- Thoroughly eliminate circular references and scatter

### Principle 3: Build Hierarchical Enforcement

- Clear hierarchy of 🔴 (execution halt level) → 🟡 (quality important) → 🟢 (recommended)
- Gradual promotion from recommended to mandatory level
- Clear indication of impact and countermeasures when violated

### Principle 4: Ensure Traceability

- Record and verify all execution results
- Technically prevent false reporting
- Objective success/failure judgment criteria

### Principle 5: Feedback-Driven Improvement

- Learn from actual failure cases
- Continuous effectiveness verification
- Automatic detection of new patterns

---

## 📋 Comprehensive Checklist

### 📐 Structure and Clarity (25 points)

#### Priority Display of Instructions (8 points)

- [ ] 🔴🟡🟢 priorities are clearly indicated for all important instructions
- [ ] Execution halt level conditions are specifically and clearly defined
- [ ] Judgment criteria for each priority are objective and verifiable
- [ ] Priority hierarchy is consistently applied

#### Complete Elimination of Ambiguous Expressions (9 points)

- [ ] **Fatal ambiguous expressions**: "As a rule", "recommended", "if possible" = 0 instances
- [ ] **Use of mandatory expressions**: Proper use of "must", "absolutely", "strictly adhere", "without exception"
- [ ] **Numerical limitation of exception conditions**: Clear boundaries like "only 3 conditions"
- [ ] **Elimination of judgment room**: Use only expressions that allow no multiple interpretations
- [ ] **Eradication of gray zones**: Clear judgment criteria for all situations

#### Strategic Information Integration (8 points)

- [ ] Multiple location scatter of important information is completely resolved
- [ ] Related instructions are logically integrated into one section
- [ ] Overall picture is comprehensively summarized in execution checklists
- [ ] No circular references or infinite loops exist

### 🎯 Executability (20 points)

#### Completeness of Specific Procedures (7 points)

- [ ] All command examples are actually executable and verified
- [ ] Environment variables, prerequisites, dependencies are completely specified
- [ ] Error handling methods are specific and executable
- [ ] Procedure order is logical and necessary

#### Ensuring Verifiability (7 points)

- [ ] Success/failure of execution results can be objectively determined
- [ ] Output examples, log formats, expected values are specifically shown
- [ ] Test methods and verification procedures are implementable
- [ ] Intermediate result check points are appropriately placed

#### Automation Adaptability (6 points)

- [ ] Format easy for scripting and CI/CD integration
- [ ] Clear separation between human judgment and AI execution areas
- [ ] Support for batch processing and parallel execution

### 🚫 Clarification of Prohibitions (15 points)

#### Systematization of Absolute Prohibitions (8 points)

- [ ] Complete listing of operations that must not be executed
- [ ] Clear indication of violation impact level (minor/major/fatal) for each prohibition
- [ ] Specific presentation of alternative methods and workarounds
- [ ] Technical rationale explanation for prohibitions

#### Strict Limitation of Exception Conditions (7 points)

- [ ] Conditions for allowing exceptions are specific and limited (numerical specification)
- [ ] Objective judgment criteria like "completely duplicate", "explicitly stated"
- [ ] Clear boundaries leaving no gray zones
- [ ] Clear additional conditions and constraints when applying exceptions

### 📊 Quality Assurance Mechanisms (20 points)

#### Completeness of Tracking System (8 points)

- [ ] Automatic recording and statistics acquisition for all execution results
- [ ] Verification function to technically prevent false reporting
- [ ] Real-time monitoring and alert functions
- [ ] Audit log tamper prevention function

#### 4.2 Template Compliance Enforcement (7 points)

- [ ] Clear definition and checking function for mandatory elements
- [ ] Technical restrictions on non-customizable sections
- [ ] Automated checkpoints for compliance verification
- [ ] Automatic correction and warning functions for violations

#### 4.3 Comprehensiveness of Error Handling (5 points)

- [ ] Complete cataloging of anticipated error patterns
- [ ] Stepped response processes for errors
- [ ] Technical prevention of reporting failures as successes

### 5. 🎭 Role and Responsibility Clarification (Score: 10 points)

#### 5.1 AI Agent Authority Scope (5 points)

- [ ] Clear boundary lines between executable and prohibited operations
- [ ] Specific scope and constraints of decision-making authority
- [ ] Clear separation of operations requiring human confirmation

#### 5.2 Classification System Unification (5 points)

- [ ] Clarity, uniqueness, and exclusivity of classification definitions
- [ ] Explicit explanations to prevent misunderstanding of importance between classifications
- [ ] Specific usage examples and decision flowcharts for each classification

### 6. 🔄 Continuous Improvement (Score: 10 points)

#### 6.1 Automation of Feedback Collection (5 points)

- [ ] Automatic extraction of improvement points from execution logs
- [ ] Machine learning-based analysis of failure patterns
- [ ] Automatic update mechanism for best practices

#### 6.2 Implementation of Learning Functions (5 points)

- [ ] Automatic detection and classification of new patterns
- [ ] Continuous monitoring of existing rule effectiveness
- [ ] Automatic suggestions for gradual improvements

---

## 🚨 Critical Problem Patterns (Requires Immediate Fix)

### ❌ Level 1: Critical Ambiguity (Execution Stop Level)

- **Multiple interpretable instructions**: "Judge appropriately", "according to situation", "as a rule"
- **Ambiguous exception conditions**: "In special cases", "as needed"
- **Subjective judgment criteria**: "Appropriately", "sufficiently", "as much as possible"
- **Undefined important concepts**: "Standard", "general", "basic"

### ❌ Level 2: Structural Defects (Quality Important Level)

- **Information scatter**: Related important information scattered in 3+ locations
- **Circular references**: Infinite loops like Section A→B→C→A
- **Contradictory instructions**: Conflicting instructions in different sections
- **Unclear execution order**: Procedures with unclear dependencies

### ❌ Level 3: Quality Degradation (Recommended Improvement Level)

- **Unverifiability**: Unclear success/failure judgment criteria
- **Automation difficulty**: Design dependent on human subjective judgment
- **Maintenance difficulty**: Structure where update impact scope is unpredictable
- **Learning difficulty**: Complexity that takes time for newcomers to understand

---

## 🎯 Proven Improvement Methods

### ✅ Gradual Strengthening Approach

1. **Current state analysis**: Problem classification, prioritization, impact assessment
2. **Critical problem priority**: Complete resolution of Level 1 problems as top priority
3. **Gradual implementation**: Execute in verifiable units rather than all changes at once
4. **Effect measurement**: Quantitative comparison before and after improvement
5. **Continuous monitoring**: Confirm sustainability of improvement effects

### ✅ Practical Methods for Ambiguity Elimination

```markdown
# ❌ Before improvement (ambiguous)

"Issues should, as a rule, be described as inline comments on the relevant changed locations on GitHub"

# ✅ After improvement (clear)

"Issues must be described as inline comments on the relevant changed locations on GitHub. Exceptions are only the 3 conditions defined in Section 3.3"
```

### ✅ Practical Methods for Information Integration

```markdown
# ❌ Before improvement (scattered)

Section 2.1: "Use mandatory 6 sections"
Section 3.5: "📊 Overall evaluation, 📋 Issues..."
Section 4.2: "Section deletion prohibited"

# ✅ After improvement (integrated)

Execution Checklist:
□ 10. Post summary comment (use mandatory 6 sections)
🔴 Mandatory 6 sections: 1) 📊 Overall evaluation 2) 📋 Issue classification summary 3) ⚠️ Major concerns 4) ✅ Commendable points 5) 🎯 Conclusion 6) 🤖 AI review quality self-assessment
❌ Absolutely prohibited: Section deletion, addition, or renaming
```

### ✅ Tracking System Implementation Patterns

```bash
# Strict tracking of execution results
POSTED_COMMENTS=0
FAILED_COMMENTS=0
TOTAL_COMMENTS=0

# Record results of each operation
if [ $? -eq 0 ]; then
    echo "✅ Success: $OPERATION" >> /tmp/execution_log.txt
    POSTED_COMMENTS=$((POSTED_COMMENTS + 1))
else
    echo "❌ Failed: $OPERATION" >> /tmp/execution_log.txt
    FAILED_COMMENTS=$((FAILED_COMMENTS + 1))
fi

# Prevention of false reporting
if [ $POSTED_COMMENTS -ne $REPORTED_COMMENTS ]; then
    echo "🚨 Warning: Reported count and actual posted count mismatch"
    exit 1
fi
```

---

## 📈 Quality Score Calculation (Improved Version)

### Overall Score Calculation

```
Base Score = Σ(Each Category Score × Points) / 100

Critical Problem Penalties:
- Level 1 problems: -20 points/case
- Level 2 problems: -10 points/case
- Level 3 problems: -5 points/case

Bonus Elements:
- Automation support: +5 points
- Learning function implementation: +5 points
- Proven improvement cases: +5 points

Final Score = Base Score + Bonus - Penalty
```

### Quality Level Assessment

```
95-100 points: World-class standard (Recommendable as industry standard)
90-94 points:  Excellent (Ready for production use)
80-89 points:  Good (Production ready with minor improvements)
70-79 points:  Average (Improvements needed)
60-69 points:  Needs improvement (Major modifications required)
50-59 points:  Major revision needed (Fundamental review required)
49 points or below: Prohibited for use (Complete redesign required)
```

---

## 🔧 Practical Improvement Process

### Phase 1: Diagnosis and Analysis (1-2 days)

1. **Overall structure understanding**: Visualization of section composition, information flow, and dependencies
2. **Ambiguity detection**: Complete extraction of expressions with room for interpretation
3. **Information scatter analysis**: Mapping patterns of related information dispersion
4. **Enforcement evaluation**: Classification and effectiveness assessment of recommendations/requirements
5. **Traceability confirmation**: Evaluation of execution result recording and verification functions

### Phase 2: Prioritization and Planning (Half day)

1. **Criticality classification**: Problem classification levels 1-3 and impact assessment
2. **Improvement order determination**: Optimal sequence considering interdependencies
3. **Resource allocation**: Optimization of balance between improvement effects and costs
4. **Risk assessment**: Prediction of side effects and compatibility issues during improvement

### Phase 3: Phased Implementation (2-5 days)

1. **Level 1 problem resolution**: Complete elimination of critical ambiguity
2. **Information integration execution**: Strategic consolidation of scattered information
3. **Enforcement strengthening**: Gradual upgrade from recommendations to requirements
4. **Tracking system implementation**: Automatic recording and verification functions for execution results
5. **Template strengthening**: Clarification of mandatory elements and enforcement of compliance

### Phase 4: Verification and Adjustment (1-2 days)

1. **Functional testing**: Operation confirmation of all changes
2. **Integration testing**: System-wide consistency confirmation
3. **Performance testing**: Execution efficiency and response confirmation
4. **Usability testing**: Verification with actual usage scenarios

### Phase 5: Operations and Monitoring (Ongoing)

1. **Effect measurement**: Quantitative comparison before and after improvement
2. **Continuous monitoring**: Early detection of quality degradation
3. **Feedback collection**: Problem extraction from actual operations
4. **Continuous optimization**: Ongoing improvement cycles

---

## 📊 Actual Improvement Cases (Detailed Version)

### Case Study: Quality Improvement of Large-Scale Prompts

#### Pre-improvement Situation

```bash
Quality Score: 70 points/100 points
- Ambiguous expressions: 15 instances found
- Information scatter: Important information scattered across 6 locations
- Insufficient enforcement: 80% recommendation-level expressions
- Tracking functionality: No execution result recording
- Error handling: Unclear failure response methods
```

#### Implemented Improvements

```bash
# 1. Ambiguity elimination (2 days)
- "In principle" → "Exceptions are only the 3 conditions in Section 3.3"
- "Recommended" → "Required" (importance level 2 or higher)
- "As appropriate" → Explicit judgment criteria specification

# 2. Information integration (1 day)
- Distributed essential 6 section information → Integrated into execution checklist
- Related prohibitions → Consolidated into one section
- Circular references resolved → Linear information flow

# 3. Tracking system implementation (1 day)
- Automatic execution result log recording
- False reporting prevention verification function
- Real-time statistics display

# 4. Error handling enhancement (half day)
- Complete cataloging of expected error patterns
- Documentation of step-by-step response processes
- Automatic recovery function implementation
```

#### Post-improvement Results

```bash
Quality Score: 90 points/100 points (+20 point improvement)
- Ambiguous expressions: 0 instances (complete elimination)
- Information integration: Essential information consolidated to 3 locations
- Enforcement: 95% mandatory-level expressions
- Tracking functionality: Fully automated
- Error handling: 90% of problems resolved automatically

Actual improvement effects:
- Judgment errors: 85% reduction
- Execution time: 40% reduction
- Error occurrence rate: 70% reduction
- User satisfaction: 95% improvement
```

### Lessons Learned and Best Practices

#### Success Factors

1. **Phased approach**: Implement in verifiable units rather than all changes at once
2. **Data-driven**: Base improvements on actual measurement data, not subjective judgment
3. **Continuous monitoring**: Regularly verify the sustainability of improvement effects
4. **Feedback emphasis**: Actively collect opinions from actual users

#### Failure Avoidance Strategies

1. **Excessive perfectionism**: Start operations at 90 points, aim for 100 points through continuous improvement
2. **Risks of bulk changes**: Always implement large-scale changes in phases
3. **Backward compatibility**: Minimize impact on existing workflows
4. **Documentation deficiency**: Record and share all changes in detail

---

### Integration with Claude

```bash
# Quality check combined with prompt files
cat your-prompt.md
/check-prompt
"Evaluate the quality of this prompt and propose improvements"

# Comparison of multiple prompt files
cat prompt-v1.md && echo "---" && cat prompt-v2.md
/check-prompt
"Compare the two versions and analyze improved points and remaining issues"

# Analysis combined with actual error logs
cat execution-errors.log
/check-prompt --deep
"Identify prompt issues that may have caused these errors"
```

### Important Notes

- **Prerequisites**: Prompt files should preferably be written in Markdown format
- **Limitations**: For large prompts (over 10,000 lines), it's recommended to divide and analyze them
- **Recommendations**: Regularly conduct prompt quality checks and continuously improve

---

_This checklist is the complete version of knowledge verified through actual prompt improvement projects and continues to evolve._
