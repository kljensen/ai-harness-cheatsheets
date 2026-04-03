// Claude Code Cheat Sheet — storyfox-inspired 80/20 split (2 pages)
// Page 1: high-frequency daily driving
// Page 2: deeper reference + setup + troubleshooting

#import "../lib/cheatsheet.typ": *

#show: cheatsheet.with(
  title: "Claude Code",
  accent: colors.blue,
  col-count: 4,
)

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//  PAGE 1 — DAILY DRIVING
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#page-title("Claude Code Cheat Sheet", subtitle: "Daily Driver — Page 1 of 2")
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
      #entry("claude --continue", "Continue latest session in this directory")
      #entry("claude --resume", "Browse/resume sessions for this directory")
      #entry("claude -n name", "Launch with a name for later resume")
      #entry("claude -w bug-123", "Run in isolated git worktree")
      #entry("cat file | claude -p", "Pipe input to Claude")
    ]
    v(card-gap)
    section(title: "Keyboard Shortcuts", icon: "⌨️", accent: colors.indigo, tint: tints.indigo)[
      #subsection("Core", accent: colors.indigo)[
        #entry("Ctrl+C", "Cancel generation/input")
        #entry("Ctrl+D", "Exit session")
        #entry("Ctrl+L", "Clear screen")
        #entry("Ctrl+R", "Reverse history search")
        #entry("Ctrl+G", "Open prompt in editor")
      ]
      #v(0.8mm)
      #subsection("Modes", accent: colors.indigo)[
        #entry("Shift+Tab", "Cycle permission modes")
        #entry("Alt+P", "Switch model")
        #entry("Alt+T", "Toggle thinking")
        #entry("Alt+O", "Toggle fast mode")
      ]
      #v(0.8mm)
      #subsection("Input", accent: colors.indigo)[
        #entry("/", "Slash command prefix")
        #entry("!", "Direct bash prefix")
        #entry("@", "File mention + autocomplete")
        #entry("\\ + Enter", "Quick newline")
      ]
    ]
  },

  // COLUMN 2
  {
    section(title: "Slash Commands", icon: "💬", accent: colors.violet, tint: tints.violet)[
      #subsection("Session", accent: colors.violet)[
        #entry("/clear", "Clear conversation")
        #entry("/compact [focus]", "Compress context")
        #entry("/resume", "Resume/switch session")
        #entry("/rename [name]", "Name current session")
        #entry("/branch [name]", "Fork conversation")
        #entry("/rewind", "Rewind checkpoint")
        #entry("/copy [N]", "Copy response")
        #entry("/export", "Export conversation")
      ]
      #v(0.8mm)
      #subsection("Control", accent: colors.violet)[
        #entry("/model [model]", "Set model")
        #entry("/effort [level]", "low/med/high/max")
        #entry("/permissions", "View/update permissions")
        #entry("/context", "Context usage view")
        #entry("/diff", "Interactive diff viewer")
        #entry("/cost", "Token/cost stats")
      ]
    ]
  },

  // COLUMN 3
  {
    section(title: "Workflows & Tips", icon: "🧠", accent: colors.emerald, tint: tints.emerald)[
      #subsection("Plan + Edit Loop", accent: colors.emerald)[
        #entry("/plan [task]", "Draft plan before edits")
        #entry("@files", "Attach exact files first")
        #entry("/diff", "Review patch before apply")
        #entry("/rewind", "Rollback bad turn quickly")
      ]
      #v(0.8mm)
      #subsection("Context Hygiene", accent: colors.emerald)[
        #entry("/context", "Watch context pressure")
        #entry("/compact [focus]", "Keep important intent")
        #entry("./CLAUDE.md", "Project memory anchor")
        #entry("/memory", "Edit memory files")
      ]
      #v(0.8mm)
      #subsection("Headless Pattern", accent: colors.emerald)[
        #entry("--bare -p \"task\"", "Deterministic automation")
        #entry("--output-format json", "Machine-readable output")
        #entry("--allowedTools \"...\"", "Constrain tool scope")
        #entry("--max-budget-usd N", "Run cost guardrail")
      ]
    ]
    v(card-gap)
    section(title: "Session Picker + Transcript", icon: "📜", accent: colors.cyan, tint: tints.cyan)[
      #entry("Ctrl+O", "Toggle transcript mode")
      #entry("/ then N / Shift+N", "Search transcript")
      #entry("Q or Esc", "Exit transcript")
      #entry("↑/↓", "Navigate session picker")
      #entry("P", "Preview selected session")
      #entry("R", "Rename session")
    ]
  },

  // COLUMN 4
  {
    section(title: "CLI Core Flags", icon: "🖥️", accent: colors.slate, tint: tints.slate)[
      #entry("-p, --print", "Non-interactive mode")
      #entry("--output-format json", "Structured output")
      #entry("--json-schema", "Validate schema")
      #entry("--permission-mode plan", "Plan-first safety")
      #entry("--allowedTools", "Allowlist tools")
      #entry("--disallowedTools", "Block specific tools")
      #entry("--model <name>", "Force model")
      #entry("--effort <level>", "Effort level")
      #entry("--add-dir <path>", "Expand scope")
    ]
    v(card-gap)
    section(title: "MCP Quick", icon: "🔌", accent: colors.purple, tint: tints.purple)[
      #entry("/mcp", "Open MCP manager")
      #entry("claude mcp add ...", "Add server")
      #entry("claude mcp list", "List servers")
      #entry("claude mcp get <name>", "Inspect server")
      #entry("claude mcp remove <name>", "Remove server")
      #entry("--transport http|stdio|sse", "Choose transport")
    ]
    v(card-gap)
    section(title: "Fast Recovery", icon: "🩺", accent: colors.rose, tint: tints.rose)[
      #entry("Bad output", "Ctrl+C then /rewind")
      #entry("Too much context", "/compact [focus]")
      #entry("Permission blocked", "Shift+Tab or /permissions")
      #entry("Need audit trail", "Ctrl+O then /export")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Page 1 of 2 — Daily Driver"
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
    section(title: "Config & Precedence", icon: "⚙️", accent: colors.slate, tint: tints.slate)[
      #entry("~/.claude/settings.json", "User defaults")
      #entry(".claude/settings.json", "Project shared settings")
      #entry(".claude/settings.local.json", "Local overrides")
      #entry("~/.claude.json", "Auth/MCP/state")
      #entry(".mcp.json", "Project MCP servers")
      #entry("managed-settings.d/", "Org policy fragments")
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

  // COLUMN 2
  {
    section(title: "MCP Reference", icon: "🔌", accent: colors.purple, tint: tints.purple)[
      #subsection("Scopes", accent: colors.purple)[
        #entry("local", "Your machine only")
        #entry("project", "Shared in repo")
        #entry("user", "Global user profile")
      ]
      #v(0.8mm)
      #subsection("Commands", accent: colors.purple)[
        #entry("claude mcp add", "Add server")
        #entry("claude mcp add-json", "Add from JSON")
        #entry("claude mcp list", "List servers")
        #entry("claude mcp get <name>", "Inspect server")
        #entry("claude mcp remove <name>", "Remove server")
        #entry("claude mcp serve", "Expose Claude as MCP")
      ]
      #v(0.8mm)
      #subsection("Flags", accent: colors.purple)[
        #entry("--transport", "http | stdio | sse")
        #entry("--header", "Attach auth headers")
        #entry("-e KEY=VALUE", "Set env for stdio server")
      ]
    ]
  },

  // COLUMN 3
  {
    section(title: "Memory, Skills, Agents", icon: "🤖", accent: colors.orange, tint: tints.orange)[
      #subsection("Memory", accent: colors.orange)[
        #entry("./CLAUDE.md", "Team memory for repo")
        #entry("~/.claude/CLAUDE.md", "Personal memory")
        #entry(".claude/rules/*.md", "Project rules")
      ]
      #v(0.8mm)
      #subsection("Skills", accent: colors.orange)[
        #entry("/skills", "List available skills")
        #entry(".claude/skills/<name>/", "Project custom skills")
        #entry("~/.claude/skills/<name>/", "Personal custom skills")
      ]
      #v(0.8mm)
      #subsection("Agents", accent: colors.orange)[
        #entry("/agents", "Manage configured agents")
        #entry("--agent <name>", "Run with explicit agent")
        #entry("Explore / Plan / General", "Built-in agent roles")
      ]
    ]
    v(card-gap)
    section(title: "Useful Pairings", icon: "🔗", accent: colors.cyan, tint: tints.cyan)[
      #entry("--bare + -p", "Stable CI automation")
      #entry("--json-schema + json", "Structured output contracts")
      #entry("-n name + --resume", "Reliable session retrieval")
      #entry("--allowedTools + mode", "Autonomy with guardrails")
    ]
  },

  // COLUMN 4
  {
    section(title: "Environment (Practical)", icon: "🌍", accent: colors.teal, tint: tints.teal)[
      #entry("ANTHROPIC_API_KEY", "API authentication")
      #entry("ANTHROPIC_MODEL", "Default model")
      #entry("CLAUDE_CODE_EFFORT_LEVEL", "Default effort")
      #entry("MAX_THINKING_TOKENS", "Thinking budget")
      #entry("CLAUDE_STREAM_IDLE_TIMEOUT_MS", "Streaming timeout")
      #entry("CLAUDE_CODE_SUBPROCESS_ENV_SCRUB", "Scrub subprocess secrets")
    ]
    v(card-gap)
    section(title: "Troubleshooting", icon: "🛠️", accent: colors.amber, tint: tints.amber)[
      #entry("Check install", "claude doctor")
      #entry("Check auth", "claude auth status --text")
      #entry("Debug logs", "--debug api,hooks")
      #entry("Debug file", "--debug-file ./claude.log")
      #entry("Isolate runtime", "--bare")
      #entry("Lock MCP source", "--strict-mcp-config")
      #entry("Narrow settings", "--setting-sources user,project")
    ]
    v(card-gap)
    section(title: "De-prioritized for Desk Use", icon: "✂️", accent: colors.pink, tint: tints.pink)[
      #entry("Niche beta flags", "Volatile / lower daily value")
      #entry("Novelty commands", "Low frequency")
      #entry("Protocol internals", "Better in full docs")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Page 2 of 2 — Deep Reference"
)
