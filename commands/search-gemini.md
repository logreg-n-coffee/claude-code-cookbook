## Gemini Web Search

Execute web search through Gemini CLI to get latest information.

### Usage

```bash
# Web search via Gemini CLI (required)
gemini --prompt "WebSearch: <search query>"
```

### Basic Examples

```bash
# Using Gemini CLI
gemini --prompt "WebSearch: React 19 new features"
gemini --prompt "WebSearch: TypeError Cannot read property of undefined solution"
```

### Integration with Claude

```bash
# Document search and summary
gemini --prompt "WebSearch: Next.js 14 App Router official documentation"
"Summarize search results and explain main features"

# Error investigation
cat error.log
gemini --prompt "WebSearch: [error message] solution"
"Suggest the most appropriate solution from search results"

# Technology comparison
gemini --prompt "WebSearch: Rust vs Go performance benchmark 2024"
"Summarize performance differences from search results"
```

### Detailed Examples

```bash
# Information collection from multiple sources
gemini --prompt "WebSearch: GraphQL best practices 2024 multiple sources"
"Compile information from multiple reliable sources in search results"

# Investigate changes over time
gemini --prompt "WebSearch: JavaScript ES2015 ES2016 ES2017 ES2018 ES2019 ES2020 ES2021 ES2022 ES2023 ES2024 features"
"Summarize major changes of each version chronologically"

# Search limited to specific domain
gemini --prompt "WebSearch: site:github.com Rust WebAssembly projects stars:>1000"
"List 10 projects in order of star count"

# Latest security information
gemini --prompt "WebSearch: CVE-2024 Node.js vulnerabilities"
"Summarize impact and countermeasures for found vulnerabilities"
```

### Prohibitions

- **Using Claude's built-in WebSearch tool is prohibited**
- When web search is needed, always use `gemini --prompt "WebSearch: ..."`

### Important Notes

- **When Gemini CLI is available, always use `gemini --prompt "WebSearch: ..."`**
- Web search results are not always up to date
- Important information should be verified with official documentation or reliable sources
