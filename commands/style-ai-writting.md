## AI Writing Check

Detects mechanical patterns in AI-generated text and provides suggestions for improvement to more natural Japanese writing.

### Usage

```bash
/ai-writing-check [options]
```

### Options

- None: Analyze current file or selected text
- `--file <path>`: Analyze specific file
- `--dir <path>`: Batch analyze files in directory
- `--severity <level>`: Detection level (all/high/medium)
- `--fix`: Automatically fix detected patterns

### Basic Examples

```bash
# Check AI-ness of file
cat README.md
/ai-writing-check
"Check the AI-ness of this document and provide improvement suggestions"

# Analyze specific file
/ai-writing-check --file docs/guide.md
"Detect AI-like expressions and suggest natural expression corrections"

# Scan entire project
/ai-writing-check --dir . --severity high
"Report only important AI-ness issues in the project"
```

### Detection Patterns

#### 1. Mechanical Patterns in List Format

```markdown
Detected examples:

- **Important**: This is an important item
- Completed item (with checkmark)
- Hot topic (with flame emoji)
- Ready to start (with rocket emoji)

Improved examples:

- Important item: This is an important item
- Completed item
- Featured topic
- Ready to start
```

#### 2. Exaggerated & Hype Expressions

```markdown
Detected examples:
Revolutionary technology will change the industry.
This completely solves the problem.
Works like magic.

Improved examples:
Effective technology brings change to the industry.
Solves many problems.
Works smoothly.
```

#### 3. Mechanical Emphasis Patterns

```markdown
Detected examples:
**Idea**: We have a new proposal (with lightbulb emoji)
**Warning**: Important warning (with warning emoji)

Improved examples:
Idea: We have a new proposal
Warning: Important warning
```

#### 4. Redundant Technical Writing

```markdown
Detected examples:
First, we will perform the initial setup.
You can use this tool.
Performance is greatly improved.

Improved examples:
First, we will perform the setup.
You can use this tool.
Performance improves by 30%.
```

### Integration with Claude

```bash
# Analyze AI-ness of entire document
cat article.md
/ai-writing-check
"Analyze from the following perspectives and provide improvement suggestions:
1. Detection of mechanical expressions
2. Correction suggestions to natural Japanese
3. Priority-based improvement list"

# Focus on specific patterns
/ai-writing-check --file blog.md
"Focus particularly on exaggerated expressions and redundant expressions for improvement suggestions"

# Batch check multiple files
find . -name "*.md" -type f
/ai-writing-check --dir docs/
"Analyze AI-ness of entire documentation and create summary"
```

### Detailed Examples

```bash
# Before and after comparison
/ai-writing-check --file draft.md
"Detect AI-like expressions and present in the following format:
- Problem areas (with line numbers)
- Problem type and reason
- Specific improvement suggestions
- Effects of improvement"

# Automatic correction mode
/ai-writing-check --file report.md --fix
"Automatically correct detected patterns and report results"

# Project AI-ness report
/ai-writing-check --dir . --severity all
"Analyze AI-ness of entire project:
1. Statistics (detection count by pattern)
2. Top 5 most problematic files
3. Improvement priority matrix
4. Staged improvement plan"
```

### Advanced Usage Examples

```bash
# Apply custom rules
/ai-writing-check --file spec.md
"Check technical specifications with the following additional criteria:
- Vague expressions (appropriate, as needed)
- Lack of specificity (fast → specific numbers)
- Inconsistent terminology usage"

# Check for CI/CD integration
/ai-writing-check --dir docs/ --severity high
"Output results in format executable by GitHub Actions:
- Number of errors and file names
- Line numbers requiring correction
- Exit code configuration"

# Style guide compliance check
/ai-writing-check --file manual.md
"Additional checks based on company style guide:
- Use of honorifics (unified polite form)
- Appropriate use of technical terms
- Consideration for readers"
```

### Important Notes

- AI-ness judgment varies by context, so please treat suggestions as reference
- Criteria are adjusted according to document types such as technical documents, blogs, manuals
- You don't need to accept all suggestions; select appropriate ones
- The `--fix` option automatically corrects detected patterns

### Command Execution Behavior

When executing the `/ai-writing-check` command, Claude performs the following processes:

1. **Pattern Detection**: Detects AI-like patterns from specified files or text
2. **Specific Correction Suggestions**: Provides correction suggestions with line numbers for each problem
3. **--fix Mode**: Automatically corrects detected patterns and displays summary results
4. **Report Generation**: Provides detection count, improvement priorities, and before/after comparisons

Claude reads actual file content and performs analysis based on textlint-rule-preset-ai-writing rules.

### Reference

This command is created based on the ruleset of [textlint-rule-preset-ai-writing](https://github.com/textlint-ja/textlint-rule-preset-ai-writing). It's a textlint rule preset for detecting mechanical patterns in AI-generated text and encouraging more natural expressions.
