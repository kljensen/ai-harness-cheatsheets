// Claude Code Cheat Sheet — 2-page desk reference
// Page 1: Daily essentials (shortcuts, commands, workflows)
// Page 2: Config, MCP, skills, agents, CLI flags

#import "../lib/cheatsheet.typ": *

#show: cheatsheet.with(
  title: "Claude Code",
  accent: colors.blue,
  col-count: 4,
)

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//  PAGE 1 — DAILY ESSENTIALS
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#page-title("Claude Code Cheat Sheet", subtitle: "v2.1 · Daily Essentials — Page 1 of 2")
#v(card-gap)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: card-gap,

  // ── COLUMN 1 ──────────────────────────────────────────────────
  {
    section(title: "Quick Start", icon: "🚀", accent: colors.blue, tint: tints.blue)[
      #entry("claude", "Interactive session")
      #entry("claude \"query\"", "Start with prompt")
      #entry("claude -p \"query\"", "Print & exit (headless)")
      #entry("claude -c", "Continue last conversation")
      #entry("claude -r \"name\"", "Resume by name/ID")
      #entry("cat f | claude -p", "Pipe input")
    ]
    v(card-gap)
    section(title: "Keyboard Shortcuts", icon: "⌨️", accent: colors.indigo, tint: tints.indigo)[
      #subsection("General Controls", accent: colors.indigo)[
        #entry("Ctrl+C", "Cancel input/generation")
        #entry("Ctrl+D", "Exit session")
        #entry("Ctrl+L", "Clear screen")
        #entry("Ctrl+R", "Reverse search history")
        #entry("Ctrl+G", "Open prompt in editor")
        #entry("Ctrl+O", "Toggle verbose/transcript")
        #entry("Ctrl+B", "Background running task")
        #entry("Ctrl+T", "Toggle task list")
        #entry("Ctrl+V", "Paste image")
        #entry("Esc Esc", "Rewind or summarize")
      ]
      #v(1mm)
      #subsection("Mode & Thinking", accent: colors.indigo)[
        #entry("Shift+Tab", "Cycle permission modes")
        #entry("Alt+P", "Switch model")
        #entry("Alt+T", "Toggle thinking")
        #entry("Alt+O", "Toggle fast mode")
      ]
      #v(1mm)
      #subsection("Input", accent: colors.indigo)[
        #entry("\\ + Enter", "Quick newline")
        #entry("Ctrl+J", "Newline (control seq)")
        #entry("/", "Slash command prefix")
        #entry("!", "Direct bash prefix")
        #entry("@", "File mention + autocomplete")
      ]
    ]
  },

  // ── COLUMN 2 ──────────────────────────────────────────────────
  {
    section(title: "Session Commands", icon: "💬", accent: colors.violet, tint: tints.violet)[
      #entry("/clear", "Clear conversation")
      #entry("/compact [focus]", "Compress context")
      #entry("/resume", "Resume/switch session")
      #entry("/rename [name]", "Name current session")
      #entry("/branch [name]", "Branch conversation")
      #entry("/cost", "Token usage stats")
      #entry("/context", "Visualize context usage")
      #entry("/diff", "Interactive diff viewer")
      #entry("/copy [N]", "Copy last response")
      #entry("/rewind", "Rewind to checkpoint")
      #entry("/export", "Export conversation")
    ]
    v(card-gap)
    section(title: "Tool Commands", icon: "🔧", accent: colors.teal, tint: tints.teal)[
      #entry("/init", "Create CLAUDE.md")
      #entry("/memory", "Edit CLAUDE.md files")
      #entry("/mcp", "Manage MCP servers")
      #entry("/hooks", "Manage hooks")
      #entry("/skills", "List available skills")
      #entry("/agents", "Manage agents")
      #entry("/chrome", "Chrome integration")
      #entry("/reload-plugins", "Hot-reload plugins")
      #entry("/add-dir <path>", "Add working directory")
    ]
    v(card-gap)
    section(title: "Config Commands", icon: "⚙️", accent: colors.slate, tint: tints.slate)[
      #entry("/config", "Open settings")
      #entry("/model [model]", "Switch model")
      #entry("/fast [on|off]", "Toggle fast mode")
      #entry("/effort [level]", "low/medium/high/max/auto")
      #entry("/vim", "Toggle vim mode")
      #entry("/theme", "Change color theme")
      #entry("/permissions", "View/update permissions")
    ]
  },

  // ── COLUMN 3 ──────────────────────────────────────────────────
  {
    section(title: "Workflows & Tips", icon: "🧠", accent: colors.emerald, tint: tints.emerald)[
      #subsection("Plan Mode", accent: colors.emerald)[
        #entry("Shift+Tab", "Normal → Auto → Plan")
        #entry("--permission-mode plan", "Start in plan mode")
        #entry("/plan [desc]", "Plan mode + auto-start")
      ]
      #v(1mm)
      #subsection("Thinking & Effort", accent: colors.emerald)[
        #entry("Alt+T", "Toggle thinking on/off")
        #entry("\"ultrathink\"", "Max effort for one turn")
        #entry("Ctrl+O", "See thinking (verbose)")
        #entry("/effort", "○ low · ◐ med · ● high · ★ max")
      ]
      #v(1mm)
      #subsection("Context Management", accent: colors.emerald)[
        #entry("/context", "Usage + optimization tips")
        #entry("/compact [focus]", "Compress with focus area")
        #entry[Auto-compact][~95% capacity (3× thrash detect)]
        #entry[1M context][Opus 4.6 (Max/Team/Enterprise)]
        #entry[CLAUDE.md][Survives compaction!]
      ]
      #v(1mm)
      #subsection("Session Power Moves", accent: colors.emerald)[
        #entry("claude -c", "Continue last conversation")
        #entry("claude -r \"name\"", "Resume by name")
        #entry("/btw question", "Side Q, no context cost")
        #entry("/loop 5m msg", "Recurring scheduled task")
      ]
      #v(1mm)
      #subsection("Git Worktrees", accent: colors.emerald)[
        #entry("-w name", "Isolated branch per feature")
        #entry("isolation: worktree", "Agent in own worktree")
        #entry("sparsePaths", "Checkout only needed dirs")
        #entry("/batch", "Auto-creates worktrees")
      ]
    ]
    v(card-gap)
    section(title: "Fast Recipes", icon: "🧪", accent: colors.cyan, tint: tints.cyan)[
      #entry("Review PR", "claude /pr-comments 123")
      #entry("Headless", "claude -p \"summarize\"")
      #entry("JSON output", "--output-format json")
      #entry("Cost cap", "--max-budget-usd 3")
      #entry("Plan mode", "--permission-mode plan")
      #entry("Resume named", "claude -r \"bugfix\"")
    ]
  },

  // ── COLUMN 4 ──────────────────────────────────────────────────
  {
    section(title: "Memory & Files", icon: "📁", accent: colors.amber, tint: tints.amber)[
      #subsection("CLAUDE.md Locations", accent: colors.amber)[
        #entry("./CLAUDE.md", "Project (team-shared)")
        #entry("~/.claude/CLAUDE.md", "Personal (all projects)")
        #entry("/etc/claude-code/", "Managed (org-wide)")
      ]
      #v(1mm)
      #subsection("Rules & Import", accent: colors.amber)[
        #entry(".claude/rules/*.md", "Project rules")
        #entry("~/.claude/rules/*.md", "User rules")
        #entry("paths: frontmatter", "Path-specific rules")
        #entry("@path/to/file", "Import in CLAUDE.md")
      ]
      #v(1mm)
      #subsection("Auto Memory", accent: colors.amber)[
        #entry[~/.claude/projects/\<proj\>/memory/][Auto-loaded memory]
        #entry[MEMORY.md + topics][25KB / 200 lines max]
      ]
    ]
    v(card-gap)
    section(title: "Special Commands", icon: "✨", accent: colors.pink, tint: tints.pink)[
      #entry("/powerup", "Interactive feature lessons")
      #entry("/btw <question>", "Side question (no context)")
      #entry("/voice", "Push-to-talk (20 langs)")
      #entry("/doctor", "Diagnose installation")
      #entry("/pr-comments [PR]", "Fetch GitHub PR comments")
      #entry("/rc", "Remote control (claude.ai)")
      #entry("/usage", "Plan limits & rate status")
      #entry("/schedule", "Cloud scheduled tasks")
      #entry("/security-review", "Security analysis")
      #entry("/help", "Show help + commands")
      #entry("/feedback", "Submit feedback (alias: /bug)")
    ]
    v(card-gap)
    section(title: "Transcript Mode", icon: "📜", accent: colors.cyan, tint: tints.cyan)[
      #entry("Ctrl+O", "Enter transcript mode")
      #entry("/", "Search transcript")
      #entry("N / Shift+N", "Next/prev match")
      #entry("Ctrl+E", "Toggle show all")
      #entry("Q / Esc", "Exit transcript")
    ]
    v(card-gap)
    section(title: "Session Picker", icon: "🗂️", accent: colors.indigo, tint: tints.indigo)[
      #entry("↑ / ↓", "Navigate sessions")
      #entry("← / →", "Expand / collapse")
      #entry("P", "Preview selected session")
      #entry("R", "Rename session")
      #entry("/", "Search in picker")
      #entry("A", "All projects")
      #entry("B", "Current branch")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Page 1 of 2 — Daily Essentials"
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

  // ── COLUMN 1 ──────────────────────────────────────────────────
  {
    section(title: "CLI Flags", icon: "🖥️", accent: colors.blue, tint: tints.blue)[
      #subsection("Core", accent: colors.blue)[
        #entry("--model <m>", "Set model for session")
        #entry("-w [name]", "Git worktree mode")
        #entry("-n / --name", "Session display name")
        #entry("--add-dir <path>", "Add directory access")
        #entry("--agent <name>", "Use specific agent")
        #entry("--verbose", "Verbose output")
      ]
      #v(1mm)
      #subsection("Headless / SDK", accent: colors.blue)[
        #entry("-p / --print", "Non-interactive mode")
        #entry("--output-format", "text / json / stream-json")
        #entry("--json-schema", "Structured output schema")
        #entry("--max-turns <n>", "Limit agentic turns")
        #entry("--max-budget-usd", "Cost cap in dollars")
        #entry("--input-format", "text / stream-json")
        #entry("--bare", "Minimal (no hooks/LSP)")
      ]
      #v(1mm)
      #subsection("Permissions", accent: colors.blue)[
        #entry("--permission-mode", "default/plan/auto/…")
        #entry("--allowedTools", "Pre-approve tools")
        #entry("--disallowedTools", "Block specific tools")
        #entry("--dangerously-skip-\npermissions", "Skip all prompts ⚠️")
      ]
      #v(1mm)
      #subsection("Session", accent: colors.blue)[
        #entry("-c / --continue", "Continue last session")
        #entry("-r / --resume", "Resume by ID/picker")
        #entry("--fork-session", "Fork on resume")
        #entry("--session-id <uuid>", "Specific session UUID")
        #entry("--from-pr [val]", "Resume from PR")
      ]
      #v(1mm)
      #subsection("Other", accent: colors.blue)[
        #entry("--effort <level>", "low/medium/high/max")
        #entry("--chrome", "Chrome integration")
        #entry("--remote", "Web session on claude.ai")
        #entry("--tmux", "tmux/iTerm pane worktree")
        #entry("--system-prompt", "Custom system prompt")
        #entry("--fallback-model", "Overload fallback (-p)")
        #entry("--mcp-config", "Load MCP from JSON")
      ]
    ]
  },

  // ── COLUMN 2 ──────────────────────────────────────────────────
  {
    section(title: "MCP Servers", icon: "🔌", accent: colors.purple, tint: tints.purple)[
      #subsection("Add Servers", accent: colors.purple)[
        #entry("--transport http", "Remote HTTP (recommended)")
        #entry("--transport stdio", "Local process")
        #entry("--transport sse", "Remote SSE")
      ]
      #v(1mm)
      #subsection("Scopes", accent: colors.purple)[
        #entry("~/.claude.json", "Local (you only)")
        #entry(".mcp.json", "Project (shared/VCS)")
        #entry("~/.claude.json", "User (global)")
      ]
      #v(1mm)
      #subsection("Manage", accent: colors.purple)[
        #entry("/mcp", "Interactive MCP UI")
        #entry("claude mcp list", "List all servers")
        #entry("claude mcp add", "Add server")
        #entry("claude mcp remove", "Remove server")
        #entry("claude mcp serve", "CC as MCP server")
        #entry("claude mcp get <n>", "Server details")
      ]
      #v(1mm)
      #subsection("Limits & Features", accent: colors.purple)[
        #entry[Elicitation][Servers request input mid-task]
        #entry[2KB cap][Tool desc + server instructions]
        #entry[maxResultSizeChars][\_meta override (up to 500K)]
      ]
    ]
    v(card-gap)
    section(title: "Config Files", icon: "📋", accent: colors.slate, tint: tints.slate)[
      #entry("~/.claude/settings.json", "User settings")
      #entry(".claude/settings.json", "Project (shared)")
      #entry(".claude/settings.local.json", "Local overrides")
      #entry("~/.claude.json", "OAuth, MCP, state")
      #entry(".mcp.json", "Project MCP servers")
      #entry("managed-settings.d/", "Drop-in policy")
    ]
    v(card-gap)
    section(title: "MCP Command Patterns", icon: "🧭", accent: colors.violet, tint: tints.violet)[
      #entry("claude mcp list", "Show configured servers")
      #entry("claude mcp add …", "Add a server")
      #entry("claude mcp get <name>", "Inspect one server")
      #entry("claude mcp remove <name>", "Delete server")
      #entry("claude mcp serve", "Expose CC as MCP server")
    ]
  },

  // ── COLUMN 3 ──────────────────────────────────────────────────
  {
    section(title: "Skills", icon: "⚡", accent: colors.orange, tint: tints.orange)[
      #subsection("Built-in Skills", accent: colors.orange)[
        #entry("/simplify", "Code review (3 parallel agents)")
        #entry("/batch", "Large parallel changes")
        #entry("/debug [desc]", "Troubleshoot from log")
        #entry("/loop [interval]", "Recurring scheduled task")
        #entry("/claude-api", "Load API + SDK reference")
      ]
      #v(1mm)
      #subsection("Custom Skill Locations", accent: colors.orange)[
        #entry(".claude/skills/<n>/", "Project skills")
        #entry("~/.claude/skills/<n>/", "Personal skills")
      ]
      #v(1mm)
      #subsection("Skill Frontmatter", accent: colors.orange)[
        #entry("description", "Auto-invocation trigger")
        #entry("allowed-tools", "Skip permission prompts")
        #entry("model", "Override model")
        #entry("effort", "Override effort level")
        #entry("paths: [globs]", "Path-specific activation")
        #entry("context: fork", "Run in subagent")
        #entry("$ARGUMENTS", "User input placeholder")
        #entry("${CLAUDE_SKILL_DIR}", "Skill's own directory")
        #entry("!`cmd`", "Dynamic context injection")
        #entry("plugin bin/", "Ship executables")
      ]
    ]
    v(card-gap)
    section(title: "Agents", icon: "🤖", accent: colors.rose, tint: tints.rose)[
      #subsection("Built-in Agents", accent: colors.rose)[
        #entry("Explore", "Fast read-only (Haiku)")
        #entry("Plan", "Research for plan mode")
        #entry("General", "Full tools, complex tasks")
        #entry("Bash", "Terminal, separate context")
      ]
      #v(1mm)
      #subsection("Agent Frontmatter", accent: colors.rose)[
        #entry("permissionMode", "default/plan/dontAsk/…")
        #entry("isolation: worktree", "Run in git worktree")
        #entry("memory: user|project", "Persistent memory")
        #entry("background: true", "Background task")
        #entry("maxTurns", "Limit agentic turns")
        #entry("initialPrompt", "Auto-submit first turn")
        #entry("SendMessage", "Resume agents")
        #entry("@agent-name", "Mention named subagents")
      ]
    ]
  },

  // ── COLUMN 4 ──────────────────────────────────────────────────
  {
    section(title: "Key Settings", icon: "🎛️", accent: colors.teal, tint: tints.teal)[
      #entry("modelOverrides", "Map picker → custom IDs")
      #entry("autoMemoryDirectory", "Custom memory dir")
      #entry("worktree.sparsePaths", "Sparse checkout dirs")
      #entry("sandbox.failIfUnavailable", "Exit if sandbox fails")
      #entry("hooks: if", "Conditional hooks")
      #entry("PermissionDenied", "Hook: auto-mode denial")
      #entry("showThinkingSummaries", "Opt-in (off by default)")
      #entry("allowedChannelPlugins", "Admin plugin allowlist")
      #entry("hooks: \"defer\"", "Pause headless → resume")
      #entry("disableSkillShellExec", "Block !`cmd` in skills")
    ]
    v(card-gap)
    section(title: "Environment Variables", icon: "🌍", accent: colors.emerald, tint: tints.emerald)[
      #subsection("Auth & Model", accent: colors.emerald)[
        #entry("ANTHROPIC_API_KEY", "API authentication")
        #entry("ANTHROPIC_MODEL", "Default model")
        #entry("ANTHROPIC_CUSTOM_\nMODEL_OPTION", "Custom /model entry")
      ]
      #v(1mm)
      #subsection("Behavior", accent: colors.emerald)[
        #entry("CLAUDE_CODE_EFFORT_LEVEL", "low/medium/high/max/auto")
        #entry("MAX_THINKING_TOKENS", "0 = thinking off")
        #entry("CLAUDE_CODE_SUBPROCESS\n_ENV_SCRUB", "Strip creds from subprocs")
        #entry("CLAUDE_STREAM_IDLE\n_TIMEOUT_MS", "Streaming watchdog (90s)")
        #entry("CLAUDE_CODE_NO_FLICKER", "Alt-screen rendering (=1)")
        #entry("MCP_CONNECTION\n_NONBLOCKING", "Skip MCP wait in -p")
        #entry("CLAUDECODE", "Detect CC shell (=1)")
      ]
    ]
    v(card-gap)
    section(title: "Subcommands", icon: "📦", accent: colors.cyan, tint: tints.cyan)[
      #entry("claude auth login", "Sign in")
      #entry("claude auth logout", "Sign out")
      #entry("claude auth status", "Auth status")
      #entry("claude mcp …", "MCP management")
      #entry("claude agents", "List agents")
      #entry("claude doctor", "Health check")
      #entry("claude update", "Check for updates")
      #entry("claude install", "Install native build")
      #entry("claude setup-token", "Long-lived auth token")
      #entry("--debug api,hooks", "Enable debug logging")
      #entry("--bare", "Minimal mode for isolation")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Page 2 of 2 — Deep Reference"
)
