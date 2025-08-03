## Node Dependencies Update

Safely update Node.js project dependencies.

### Usage

```bash
# Check dependency status and request Claude
npm outdated
"Update package.json dependencies to the latest versions"
```

### Basic Examples

```bash
# Check current dependencies
cat package.json
"Analyze this Node.js project's dependencies and tell me which packages can be updated"

# Check available updates
npm outdated
"Analyze the risk level of updating these packages"
```

### Integration with Claude

```bash
# Comprehensive dependency update
cat package.json
"Analyze Node.js dependencies and perform the following:
1. Investigate the latest version of each package
2. Check for breaking changes
3. Evaluate risk level (safe/caution/dangerous)
4. Propose necessary code changes
5. Generate updated package.json"

# Safe gradual update
npm outdated
"Avoid major version upgrades and update only packages that can be safely updated"

# Analyze impact of specific package update
"Tell me the impact and necessary changes if express is updated to the latest version"
```

### Detailed Examples

```bash
# Detailed analysis including Release Notes
cat package.json && npm outdated
"Analyze dependencies and present for each package:
1. Current → Latest version
2. Risk assessment (safe/caution/dangerous)
3. Main changes (from CHANGELOG)
4. Necessary code modifications
in table format"

# TypeScript project considering type definitions
cat package.json tsconfig.json
"Update dependencies including TypeScript type definitions and create an update plan that prevents type errors"
```

### Risk Level Criteria

```
Safe (🟢):
- Patch version update (1.2.3 → 1.2.4)
- Bug fixes only
- Backward compatibility guaranteed

Caution (🟡):
- Minor version update (1.2.3 → 1.3.0)
- New feature additions
- Deprecation warnings present

Dangerous (🔴):
- Major version update (1.2.3 → 2.0.0)
- Breaking changes
- API removal/modification
```

### Executing Updates

```bash
# Create backup
cp package.json package.json.backup
cp package-lock.json package-lock.json.backup

# Execute update
npm update

# Post-update verification
npm test
npm run build
npm audit
```

### Notes

Always perform functionality testing after updates. If problems occur, restore with:

```bash
cp package.json.backup package.json
cp package-lock.json.backup package-lock.json
npm install
```
