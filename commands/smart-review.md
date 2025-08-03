## Smart Review

Analyzes the current situation and automatically suggests optimal roles and approaches.

### Usage

```bash
/smart-review                    # Analyze current directory
/smart-review <file/directory>   # Analyze specific target
```

### Automatic Detection Logic

### Detection by File Extension

- `package.json`, `*.tsx`, `*.jsx`, `*.css`, `*.scss` → **frontend**
- `Dockerfile`, `docker-compose.yml`, `*.yaml` → **architect**
- `*.test.js`, `*.spec.ts`, `test/`, `__tests__/` → **qa**
- `*.rs`, `Cargo.toml`, `performance/` → **performance**

### Security-Related File Detection

- `auth.js`, `security.yml`, `.env`, `config/auth/` → **security**
- `login.tsx`, `signup.js`, `jwt.js` → **security + frontend**
- `api/auth/`, `middleware/auth/` → **security + architect**

### Composite Detection Patterns

- `mobile/` + `*.swift`, `*.kt`, `react-native/` → **mobile**
- `webpack.config.js`, `vite.config.js`, `large-dataset/` → **performance**
- `components/` + `responsive.css` → **frontend + mobile**
- `api/` + `auth/` → **security + architect**

### Error and Issue Analysis

- Stack trace, `error.log`, `crash.log` → **analyzer**
- `memory leak`, `high CPU`, `slow query` → **performance + analyzer**
- `SQL injection`, `XSS`, `CSRF` → **security + analyzer**

### Suggestion Patterns

### Single Role Suggestion

```bash
$ /smart-review src/auth/login.js
→ "Authentication file detected"
→ "Recommend analysis with security role"
→ "Execute? [y]es / [n]o / [m]ore options"
```

### Multiple Role Suggestion

```bash
$ /smart-review src/mobile/components/
→ "📱🎨 Mobile + Frontend elements detected"
→ "Recommended approaches:"
→ "[1] mobile role only"
→ "[2] frontend role only"  
→ "[3] multi-role mobile,frontend"
→ "[4] role-debate mobile,frontend"
```

### Suggestions for Issue Analysis

```bash
$ /smart-review error.log
→ "⚠️ Error log detected"
→ "Starting root cause analysis with analyzer role"
→ "[Auto-execute] /role analyzer"

$ /smart-review slow-api.log
→ "🐌 Performance issue detected"
→ "Recommended: [1]/role performance [2]/role-debate performance,analyzer"
```

### Suggestions for Complex Design Decisions

```bash
$ /smart-review architecture-design.md
→ "🏗️🔒⚡ Architecture + Security + Performance elements detected"
→ "Due to complex design decisions, discussion format is recommended"
→ "[Recommended] /role-debate architect,security,performance"
→ "[Alternative] /multi-role architect,security,performance"
```

### Detailed Suggestion Logic

### Priority Determination

1. **Security** - Authentication, authorization, encryption are top priority
2. **Critical Errors** - System outages and data loss are urgent
3. **Architecture** - Large-scale changes and technology selection require careful consideration
4. **Performance** - Directly affects user experience
5. **Frontend/Mobile** - UI/UX improvements
6. **QA** - Quality assurance and testing

### Conditions for Recommending Discussion

- When 3 or more roles are involved
- When there are security vs performance trade-offs
- When major architectural changes are included
- When both mobile and web are affected

### Basic Examples

```bash
# Analyze current directory
/smart-review
"Suggest optimal roles and approaches"

# Analyze specific file
/smart-review src/auth/login.js
"Suggest optimal review method for this file" 

# Analyze error log
/smart-review error.log
"Suggest optimal approach to resolve this error"
```

### Practical Examples

### Full Project Analysis

```bash
$ /smart-review
→ "📊 Analyzing project..."
→ "React + TypeScript project detected"
→ "Authentication features + API + Mobile support confirmed"
→ ""
→ "💡 Recommended workflow:"
→ "1. security for authentication system check"
→ "2. frontend for UI/UX evaluation"
→ "3. mobile for mobile optimization check"
→ "4. architect for overall design review"
→ ""
→ "Auto-execute? [y]es / [s]elect role / [c]ustom"
```

### Specific Issue Analysis

```bash
$ /smart-review "How should JWT expiration time be set?"
→ "🤔 Technical design decision detected"
→ "This issue requires multiple expert perspectives"
→ ""
→ "Recommended approach:"
→ "/role-debate security,performance,frontend"
→ "Reason: Balance of security, performance, and UX is important"
```

### Integration with Claude

```bash
# Analysis combined with file content
cat src/auth/middleware.js
/smart-review
"Analyze this file content from a security perspective"

# Analysis combined with errors
npm run build 2>&1 | tee build-error.log
/smart-review build-error.log
"Suggest solutions for build errors"

# Design consultation
/smart-review
"Discuss whether to choose React Native or Progressive Web App"
```

### Important Notes

- Suggestions are for reference only. Final decisions should be made by the user
- For complex issues, discussion format (role-debate) is recommended
- Simple issues are often sufficient with single role
- Security-related matters always recommend verification by specialized roles
