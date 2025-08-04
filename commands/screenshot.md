## Screenshot

Capture screenshots on macOS and analyze images.

### Usage

```bash
/screenshot [options]
```

### Options

- None: Select window (Claude confirms options)
- `--window`: Specify window to capture
- `--full`: Capture entire screen
- `--crop`: Select region to capture

### Basic Examples

```bash
# Capture window and analyze
/screenshot --window
"Analyze the captured screen"

# Select region and analyze
/screenshot --crop
"Describe the content of the selected region"

# Capture full screen and analyze
/screenshot --full
"Analyze the overall composition of the screen"
```

### Integration with Claude

```bash
# No specific issues - situation analysis
/screenshot --crop
(Claude automatically analyzes screen content and describes elements and composition)

# UI/UX problem analysis
/screenshot --window
"Analyze problems with this UI and suggest improvements"

# Error analysis
/screenshot --window
"Explain the cause and solution for this error message"

# Design review
/screenshot --full
"Evaluate this design from a UX perspective"

# Code analysis
/screenshot --crop
"Point out problems with this code"

# Data visualization analysis
/screenshot --crop
"Analyze trends that can be read from this graph"
```

### Detailed Examples

```bash
# Multi-perspective analysis
/screenshot --window
"Analyze this screen from the following perspectives:
1. UI consistency
2. Accessibility issues
3. Improvement suggestions"

# Multiple captures for comparison analysis
/screenshot --window
# (Save before image)
# Make changes
/screenshot --window
# (Save after image)
"Compare the before and after images and analyze changes and improvement effects"

# Focus on specific elements
/screenshot --crop
"Evaluate whether the selected button design harmonizes with other elements"
```

### Prohibited Actions

- **It is prohibited to say "screenshot taken" without actually taking a screenshot**
- **It is prohibited to attempt analysis of non-existent image files**
- **The `/screenshot` command does not perform actual screenshot capture**

### Important Notes

- When no options are specified, present the following choices:

  ```
  "Which method would you like to use for taking a screenshot?
  1. Select window (--window) → screencapture -W
  2. Full screen (--full) → screencapture -x
  3. Select region (--crop) → screencapture -i"
  ```

- Start image analysis after the user executes the screencapture command
- Specifying concrete problems or perspectives enables more focused analysis
