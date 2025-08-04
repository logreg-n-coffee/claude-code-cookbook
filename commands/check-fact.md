## Check Fact

A command to verify the accuracy of given information by referencing the codebase and documentation (docs/, README.md, etc.) within the project.

### Usage

```bash
# Basic usage
/check-fact "The Flutter app uses Riverpod"

# Check multiple pieces of information at once
/check-fact "This project uses GraphQL and manages routing with auto_route"

# Check specific technical specifications
/check-fact "Authentication uses JWT and does not use Firebase Auth"
```

### Verification Process

1. **Information Source Priority**
   - Codebase (most reliable)
   - README.md, documentation in docs/
   - Configuration files like package.json, pubspec.yaml
   - Issue and Pull Request discussion history

2. **Result Classification**
   - `✅ Correct` - Information completely matches the codebase
   - `❌ Incorrect` - Information is clearly wrong
   - `⚠️ Partially correct` - Partially accurate but incomplete
   - `❓ Cannot determine` - Insufficient information for verification

3. **Evidence Documentation**
   - Relevant file names and line numbers
   - Related code snippets
   - Relevant documentation sections

### Report Format

```
## Fact Check Results

### Verification Target
"[Information provided by user]"

### Conclusion
[✅/❌/⚠️/❓] [Judgment result]

### Evidence
- **File**: `path/to/file.dart:123`
- **Content**: [Relevant code/text]
- **Supplement**: [Additional explanation]

### Detailed Explanation
[If incorrect, provide correct information]
[If partially correct, point out inaccurate parts]
[If cannot determine, explain missing information]
```

### Basic Examples

```bash
# Project tech stack verification
/check-fact "This app has a Flutter + Riverpod + GraphQL configuration"

# Implementation status verification  
/check-fact "Dark mode feature is implemented and can be toggled from user settings"

# Architecture verification
/check-fact "All state management is done with Riverpod, BLoC is not used"

# Security implementation verification
/check-fact "Authentication tokens are encrypted and stored in secure storage"
```

### Integration with Claude

```bash
# Verification after analyzing entire codebase
ls -la && find . -name "pubspec.yaml" -exec cat {} \;
/check-fact "The main dependencies used in this project are..."

# Verify specific feature implementation status
grep -r "authentication" . --include="*.dart"
/check-fact "Authentication feature is custom implementation, no third-party authentication is used"

# Verify consistency with documentation
cat README.md
/check-fact "All features listed in README are implemented"
```

### Use Cases

- Technical specification creation: Verify accuracy of content
- Project handover: Confirm understanding of existing implementation
- Pre-client reporting: Fact-check implementation status
- Technical blog writing: Verify article content accuracy
- Interview/presentation material creation: Confirm project overview accuracy

### Notes

- Codebase is the most reliable source of information
- When documentation is outdated, implementation takes priority
- When insufficient information is available for judgment, honestly mark as "Cannot determine"
- Security-related information requires particularly careful verification
