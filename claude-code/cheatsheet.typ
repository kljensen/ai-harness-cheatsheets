// Claude Code Cheat Sheet — 80/20 desk reference (2 pages)
// Page 1: Daily-driving commands (CLI + TUI)
// Page 2: Deep reference (flags, MCP, config, troubleshooting)

#import "../lib/cheatsheet.typ": *

#show: cheatsheet.with(
  title: "Claude Code",
  accent: colors.blue,
  col-count: 4,
)

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//  PAGE 1 — DAILY DRIVING (80/20)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#page-title("Claude Code Cheat Sheet", subtitle: "Daily 80/20 — Page 1 of 2")
#v(card-gap)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: card-gap,

  // COLUMN 1
  {
    section(title: "Launch & Resume (CLI)", icon: "🚀", accent: colors.blue, tint: tints.blue)[
      #entry("claude", "Start interactive session")
      #entry("claude \"prompt\"", "Start with prompt")
      #entry("claude -p \"prompt\"", "One-shot headless run")
      #entry("claude -c", "Continue latest in repo")
      #entry("claude -r \"name|id\"", "Resume specific session")
      #entry("claude -n name", "Name session for later resume")
      #entry("cat file | claude -p", "Pipe input to Claude")
    ]
    v(card-gap)
    section(title: "Input Grammar", icon: "⌨️", accent: colors.indigo, tint: tints.indigo)[
      #entry("/", "Slash command mode")
      #entry("!", "Run shell command inline")
      #entry("@", "Mention file/path")
      #entry("\\ + Enter", "Insert newline without send")
      #entry("Ctrl+J", "Alternative newline")
    ]
    v(card-gap)
    section(title: "Safety + Output", icon: "🛡️", accent: colors.violet, tint: tints.violet)[
      #entry("--output-format json", "Machine-readable output")
      #entry("--permission-mode plan", "Plan-first safe mode")
      #entry("--allowedTools \"...\"", "Constrain tool access")
      #entry("--max-budget-usd N", "Cap run cost")
    ]
    v(card-gap)
    section(title: "Headless Template", icon: "📦", accent: colors.blue, tint: tints.blue)[
      #entry("claude --bare -p \"task\"", "Deterministic automation base")
      #entry("+ --output-format json", "Structured parser-friendly output")
      #entry("+ --allowedTools \"Read,Edit\"", "Least-privilege tool scope")
      #entry("+ --max-turns 8", "Prevent runaway loops")
    ]
  },

  // COLUMN 2
  {
    section(title: "Core Shortcuts", icon: "⚡", accent: colors.teal, tint: tints.teal)[
      #entry("Ctrl+C", "Cancel generation/input")
      #entry("Ctrl+D", "Exit session")
      #entry("Ctrl+L", "Clear screen")
      #entry("Ctrl+R", "Reverse history search")
      #entry("Ctrl+G", "Open prompt in editor")
      #entry("Ctrl+O", "Toggle verbose/transcript")
      #entry("Ctrl+B", "Background running task")
      #entry("Ctrl+T", "Toggle task list")
      #entry("Esc Esc", "Rewind or summarize")
    ]
    v(card-gap)
    section(title: "Mode Controls", icon: "🎛️", accent: colors.slate, tint: tints.slate)[
      #entry("Shift+Tab", "Cycle permission modes")
      #entry("Alt+P", "Switch model")
      #entry("Alt+T", "Toggle thinking")
      #entry("Alt+O", "Toggle fast mode")
      #entry("/model [model]", "Set model explicitly")
      #entry("/effort [level]", "low/med/high/max")
      #entry("/permissions", "Inspect/update permissions")
    ]
    v(card-gap)
    section(title: "Transcript Quick Nav", icon: "📜", accent: colors.cyan, tint: tints.cyan)[
      #entry("Ctrl+O", "Enter transcript/search mode")
      #entry("/", "Find text in transcript")
      #entry("N / Shift+N", "Next / previous match")
      #entry("Q or Esc", "Exit transcript mode")
    ]
  },

  // COLUMN 3
  {
    section(title: "Daily Slash Commands", icon: "💬", accent: colors.emerald, tint: tints.emerald)[
      #entry("/clear", "Clear current conversation")
      #entry("/compact [focus]", "Compress context intentionally")
      #entry("/resume", "Resume/switch session")
      #entry("/rewind", "Rollback to earlier checkpoint")
      #entry("/context", "Inspect context pressure")
      #entry("/diff", "Review proposed changes")
      #entry("/copy [N]", "Copy last or Nth response")
      #entry("/cost", "Token/cost usage")
      #entry("/memory", "Edit CLAUDE.md memory")
      #entry("/help", "Show command reference")
    ]
    v(card-gap)
    section(title: "Context Anchors", icon: "📁", accent: colors.amber, tint: tints.amber)[
      #entry("./CLAUDE.md", "Project memory anchor")
      #entry("~/.claude/CLAUDE.md", "Personal global memory")
      #entry("/compact", "Use before context gets bloated")
    ]
    v(card-gap)
    section(title: "Permission Modes", icon: "🔐", accent: colors.emerald, tint: tints.emerald)[
      #entry("default", "Ask before protected actions")
      #entry("plan", "Research/plan without edits")
      #entry("auto", "Auto-approve safer operations")
      #entry("dontAsk", "High autonomy in trusted repo")
    ]
  },

  // COLUMN 4
  {
    section(title: "Daily Recipes", icon: "🧪", accent: colors.cyan, tint: tints.cyan)[
      #entry("Headless summary", "claude -p \"summarize README\"")
      #entry("JSON pipeline", "claude -p ... --output-format json")
      #entry("Safe planning", "claude --permission-mode plan")
      #entry("Resume by name", "claude -n fix-auth ; claude -r fix-auth")
      #entry("Budgeted run", "claude -p ... --max-budget-usd 3")
      #entry("Worktree task", "claude -w bug-123")
    ]
    v(card-gap)
    section(title: "When Stuck", icon: "🩺", accent: colors.rose, tint: tints.rose)[
      #entry("Interrupted output", "Ctrl+C then /rewind")
      #entry("Context too large", "/compact [goal]")
      #entry("Wrong mode", "Shift+Tab then /permissions")
      #entry("Need audit trail", "Ctrl+O then /export")
      #entry("Lost prior session", "/resume or claude -r")
    ]
    v(card-gap)
    section(title: "Session Picker", icon: "🗂️", accent: colors.indigo, tint: tints.indigo)[
      #entry("↑ / ↓", "Navigate sessions")
      #entry("P", "Preview selected session")
      #entry("R", "Rename session")
      #entry("/", "Search sessions")
    ]
    v(card-gap)
    section(title: "Task Playbooks", icon: "🧭", accent: colors.pink, tint: tints.pink)[
      #entry("Refactor", "@files → /plan → apply edits")
      #entry("Bugfix", "repro steps → /diff → /rewind if needed")
      #entry("PR review", "/pr-comments → /copy summary")
      #entry("Long thread", "/context → /compact [focus]")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Page 1 of 2 — Daily 80/20"
)

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//  PAGE 2 — DEEP REFERENCE
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#pagebreak()

#page-title("Claude Code Cheat Sheet", subtitle: "Deep Reference — Page 2 of 2")
#v(card-gap)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: card-gap,

  // COLUMN 1
  {
    section(title: "CLI Flag Matrix", icon: "🖥️", accent: colors.blue, tint: tints.blue)[
      #subsection("Session Lifecycle", accent: colors.blue)[
        #entry("-c, --continue", "Continue latest in repo")
        #entry("-r, --resume", "Resume by name/ID")
        #entry("-n, --name", "Set session name")
        #entry("--from-pr", "Resume linked PR session")
      ]
      #v(1mm)
      #subsection("Headless / Automation", accent: colors.blue)[
        #entry("-p, --print", "Non-interactive run")
        #entry("--bare", "Minimal deterministic startup")
        #entry("--output-format", "text / json / stream-json")
        #entry("--json-schema", "Validate structured output")
        #entry("--max-turns", "Cap agentic turns")
        #entry("--max-budget-usd", "Cap spend")
      ]
      #v(1mm)
      #subsection("Safety", accent: colors.blue)[
        #entry("--permission-mode", "default/plan/auto/...")
        #entry("--allowedTools", "Allowlist tool usage")
        #entry("--disallowedTools", "Block risky tools")
      ]
    ]
    v(card-gap)
    section(title: "Interactive Add-ons", icon: "🧰", accent: colors.indigo, tint: tints.indigo)[
      #entry("--model <name>", "Force model selection")
      #entry("--effort <level>", "Set effort level")
      #entry("--add-dir <path>", "Expand accessible dirs")
      #entry("-w, --worktree [name]", "Isolated git worktree")
    ]
  },

  // COLUMN 2
  {
    section(title: "Config & Precedence", icon: "⚙️", accent: colors.slate, tint: tints.slate)[
      #entry("~/.claude/settings.json", "User defaults")
      #entry(".claude/settings.json", "Project shared settings")
      #entry(".claude/settings.local.json", "Local overrides")
      #entry("~/.claude.json", "Auth/MCP/state")
      #entry(".mcp.json", "Project MCP servers")
      #entry("managed-settings.d/", "Org policy fragments")
    ]
    v(card-gap)
    section(title: "MCP Essentials", icon: "🔌", accent: colors.purple, tint: tints.purple)[
      #entry("claude mcp add ...", "Add MCP server")
      #entry("claude mcp list", "List configured servers")
      #entry("claude mcp get <name>", "Inspect server config")
      #entry("claude mcp remove <name>", "Remove server")
      #entry("claude mcp serve", "Expose Claude as MCP")
      #entry("--transport http|stdio|sse", "Server transport type")
      #entry("--scope local|project|user", "Where config is stored")
    ]
    v(card-gap)
    section(title: "Useful Pairings", icon: "🔗", accent: colors.slate, tint: tints.slate)[
      #entry("--json-schema + json", "Structured output")
      #entry("-n name + -r name", "Resume reliably")
      #entry("--bare + -p", "Stable CI runs")
      #entry("--allowedTools + mode", "Safe autonomy")
    ]
  },

  // COLUMN 3
  {
    section(title: "Memory, Skills, Agents", icon: "🤖", accent: colors.orange, tint: tints.orange)[
      #subsection("Memory", accent: colors.orange)[
        #entry("./CLAUDE.md", "Team memory for this repo")
        #entry("~/.claude/CLAUDE.md", "Personal memory")
        #entry("/memory", "Edit memory from TUI")
      ]
      #v(1mm)
      #subsection("Skills", accent: colors.orange)[
        #entry("/skills", "List available skills")
        #entry(".claude/skills/<name>/", "Project custom skills")
        #entry("~/.claude/skills/<name>/", "Personal custom skills")
      ]
      #v(1mm)
      #subsection("Agents", accent: colors.orange)[
        #entry("/agents", "Manage configured agents")
        #entry("--agent <name>", "Run with explicit agent")
        #entry("Explore / Plan / General", "Built-in agent roles")
      ]
    ]
    v(card-gap)
    section(title: "Auth & Updates", icon: "🔐", accent: colors.emerald, tint: tints.emerald)[
      #entry("claude auth login", "Sign in")
      #entry("claude auth status", "Check current auth")
      #entry("claude auth logout", "Sign out")
      #entry("claude setup-token", "Long-lived token setup")
      #entry("claude update", "Check/apply updates")
      #entry("claude doctor", "Health check")
    ]
  },

  // COLUMN 4
  {
    section(title: "Environment (Practical)", icon: "🌍", accent: colors.teal, tint: tints.teal)[
      #entry("ANTHROPIC_API_KEY", "API authentication")
      #entry("ANTHROPIC_MODEL", "Default model")
      #entry("CLAUDE_CODE_EFFORT_LEVEL", "Default effort")
      #entry("MAX_THINKING_TOKENS", "Set thinking budget")
      #entry("CLAUDE_STREAM_IDLE_TIMEOUT_MS", "Streaming timeout")
      #entry("CLAUDE_CODE_SUBPROCESS_ENV_SCRUB", "Scrub secrets in subprocesses")
    ]
    v(card-gap)
    section(title: "Troubleshooting", icon: "🛠️", accent: colors.amber, tint: tints.amber)[
      #entry("Check install", "claude doctor")
      #entry("Check auth", "claude auth status --text")
      #entry("Debug logs", "--debug api,hooks")
      #entry("Write debug file", "--debug-file ./claude.log")
      #entry("Isolate runtime", "--bare")
      #entry("Lock MCP source", "--strict-mcp-config")
      #entry("Narrow settings", "--setting-sources user,project")
    ]
    v(card-gap)
    section(title: "What We Intentionally Omit", icon: "✂️", accent: colors.pink, tint: tints.pink)[
      #entry("Niche/beta flags", "Too volatile for desk use")
      #entry("Long novelty command lists", "Low daily value")
      #entry("Deep protocol internals", "Belong in full docs")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Page 2 of 2 — Deep Reference"
)
