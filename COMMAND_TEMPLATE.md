# Command Name

Concise description of the command (explain what the command does in one line).

<!-- 
Notes when using template:
- Required sections: Title, Description, Usage, Basic Examples, Claude Integration, Notes
- Optional sections: Options, Detailed Features, Output Examples, Best Practices, Related Commands
- Use only necessary sections depending on command complexity
-->

## Usage

```bash
/command-name [options]
```

## Options

- None : Default behavior
- `--option1` : Description of option 1
- `--option2 <value>` : Description of option that takes parameters
- `--flag` : Description of flag option

※ This entire section can be omitted if options are not needed for the command.

## Basic Examples

```bash
# Basic usage
/command-name
"Description when executing"

# Example with options
/command-name --option1
"Description when using option 1"

# Example with parameter option
/command-name --option2 value
"Example of using parameter option"

# Combination of multiple options
/command-name --option1 --flag
"Example combining multiple options"
```

## Detailed Features (Optional)

### Feature Category 1

Detailed description of features and usage scenarios.

```bash
# Specific code example
command example
```

### Feature Category 2

Detailed description of another feature.

- **Feature 1**: Description
- **Feature 2**: Description
- **Feature 3**: Description

※ This section can be omitted for simple commands.

## Output Examples (Optional)

```text
Example of expected output format
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Sample of actual output content
├─ Item 1: Value
├─ Item 2: Value
└─ Item 3: Value
```

※ This section can be omitted if output is simple or sufficiently explained in basic examples.

## Claude Integration

```bash
# Usage example combined with files
cat file.txt
/command-name
"Request analysis including file content"

# Pipeline usage example
command1 | command2
/command-name
"Processing using output from previous command"

# Complex analysis example
ls -la && cat config.json
/command-name --option1
"Analysis combining multiple information sources"
```

## Notes

- **Prerequisites**: Prerequisites required for command execution
- **Limitations**: Feature limitations and points to be careful about
- **Recommendations**: Recommended methods for effective usage

## Best Practices (Optional)

1. **Principle 1**: Description of recommended usage methods
2. **Principle 2**: Description of usage methods to avoid
3. **Principle 3**: Recommendations regarding performance and efficiency
4. **Principle 4**: Recommendations regarding security and safety

※ This section can be omitted for simple commands without special considerations.

## Related Commands (Optional)

- `/related-command1` : Command with related functionality
- `/related-command2` : Command effective when used in combination
- `/related-command3` : Command that can be used as alternative

※ This section can be omitted if there are no related commands.
