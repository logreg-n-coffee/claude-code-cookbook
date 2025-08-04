## Rust Dependencies Update

Safely update dependencies in Rust projects.

### Usage

```bash
# Check dependency status and request to Claude
cargo tree
"Update Cargo.toml dependencies to latest versions"
```

### Basic Examples

```bash
# Check current dependencies
cat Cargo.toml
"Analyze this Rust project's dependencies and tell me which crates can be updated"

# Check updatable list
cargo update --dry-run
"Analyze the risk level of updating these crates"
```

### Integration with Claude

```bash
# Comprehensive dependency update
cat Cargo.toml
"Analyze Rust dependencies and perform the following:
1. Research latest versions of each crate
2. Check for breaking changes
3. Assess risk level (safe/caution/dangerous)
4. Suggest necessary code changes
5. Generate updated Cargo.toml"

# Safe gradual update
cargo tree
"Update only crates that can be safely updated, avoiding major version upgrades"

# Analyze impact of specific crate update
"Tell me the impact and necessary changes if tokio is updated to the latest version"
```

### Detailed Examples

```bash
# Detailed analysis including Release Notes
cat Cargo.toml && cargo tree
"Analyze dependencies and for each crate:"
1. Current → Latest version
2. Risk assessment (safe/caution/dangerous)
3. Major changes (from CHANGELOG)
4. Trait boundary changes
5. Required code fixes
Present in table format"

# Async runtime migration analysis
cat Cargo.toml src/main.rs
"Present all changes needed for migration from async-std to tokio, or tokio major version upgrade"
```

### Risk Level Criteria

```
Safe (🟢):
- Patch version upgrade (0.1.2 → 0.1.3)
- Bug fixes only
- Backward compatibility guaranteed

Caution (🟡):
- Minor version upgrade (0.1.0 → 0.2.0)
- New feature additions
- Deprecation warnings present

Dangerous (🔴):
- Major version upgrade (0.x.y → 1.0.0, 1.x.y → 2.0.0)
- Breaking changes
- API deletions/changes
- Trait boundary changes
```

### Executing Updates

```bash
# Create backup
cp Cargo.toml Cargo.toml.backup
cp Cargo.lock Cargo.lock.backup

# Execute update
cargo update

# Post-update verification
cargo check
cargo test
cargo clippy
```

### Important Notes

Always perform functionality verification after updates. If problems occur, restore with:

```bash
cp Cargo.toml.backup Cargo.toml
cp Cargo.lock.backup Cargo.lock
cargo build
```
