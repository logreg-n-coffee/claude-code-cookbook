## Flutter Dependencies Update

Safely update dependencies in Flutter projects.

### Usage

```bash
# Check dependency status and request to Claude
flutter pub deps --style=compact
"Update pubspec.yaml dependencies to latest versions"
```

### Basic Examples

```bash
# Check current dependencies
cat pubspec.yaml
"Analyze this Flutter project's dependencies and tell me which packages can be updated"

# Check after upgrade
flutter pub upgrade --dry-run
"Check if there are breaking changes in this planned upgrade content"
```

### Integration with Claude

```bash
# Comprehensive dependency update
cat pubspec.yaml
"Analyze Flutter dependencies and perform the following:
1. Research latest versions of each package
2. Check for breaking changes
3. Assess risk level (safe/caution/dangerous)
4. Suggest necessary code changes
5. Generate updated pubspec.yaml"

# Safe gradual update
flutter pub outdated
"Update only packages that can be safely updated, avoiding major version upgrades"

# Analyze impact of specific package update
"Tell me the impact and necessary changes if provider is updated to the latest version"
```

### Detailed Examples

```bash
# Detailed analysis including Release Notes
cat pubspec.yaml && flutter pub outdated
"Analyze dependencies and for each package:"
1. Current → Latest version
2. Risk assessment (safe/caution/dangerous)
3. Major changes (from CHANGELOG)
4. Required code fixes
Present in table format"

# Null Safety migration analysis
cat pubspec.yaml
"Identify packages not compatible with Null Safety and create migration plan"
```

### Risk Level Criteria

```
Safe (🟢):
- Patch version upgrade (1.2.3 → 1.2.4)
- Bug fixes only
- Backward compatibility guaranteed

Caution (🟡):
- Minor version upgrade (1.2.3 → 1.3.0)
- New feature additions
- Deprecation warnings present

Dangerous (🔴):
- Major version upgrade (1.2.3 → 2.0.0)
- Breaking changes
- API deletions/changes
```

### Executing Updates

```bash
# Create backup
cp pubspec.yaml pubspec.yaml.backup
cp pubspec.lock pubspec.lock.backup

# Execute update
flutter pub upgrade

# Post-update verification
flutter analyze
flutter test
flutter pub deps --style=compact
```

### Important Notes

Always perform functionality verification after updates. If problems occur, restore with:

```bash
cp pubspec.yaml.backup pubspec.yaml
cp pubspec.lock.backup pubspec.lock
flutter pub get
```
