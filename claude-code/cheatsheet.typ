// Claude Code Cheat Sheet — single-page non-developer draft

#import "../lib/cheatsheet.typ": *

#show: cheatsheet.with(
  title: "Claude Code",
  accent: colors.blue,
  col-count: 4,
)

#page-title("Claude Code Cheat Sheet", subtitle: "Single-Page Draft — Non-Developer Focus")
#v(card-gap)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: card-gap,

  // Column 1
  {
    section(title: "Launching", icon: "", accent: colors.blue, tint: tints.blue)[
      #section-intro([You launch Claude from your terminal/shell by typing one of these.], tint: tints.blue)
      #entry("claude", "Start interactive session")
      #entry("claude \"prompt\"", "Start with a prompt")
      #entry("claude -p \"prompt\"", "Respond to a prompt and exit immediately")
    ]
    v(card-gap)
    section(title: "Flags", icon: "", accent: colors.slate, tint: tints.slate)[
      #section-intro([Flags change how Claude runs when launching from terminal.], tint: tints.slate)
      #entry("-p, --print", "One-shot answer and exit")
      #entry("--continue", "Continue latest session in this dir")
      #entry("--resume", "Browse/resume sessions")
      #entry("--model", "Choose model")
      #entry("--effort", "Set effort")
      #entry("--permission-mode plan", "Start in plan (read-only) mode")
      #entry("--allowedTools", "Pre-approve allowed tools")
      #entry("--max-turns", "Limit agent turn count")
      #entry("--max-budget-usd", "Set max cost for print mode")
      #entry("--output-format json", "Structured output")
      #entry("--json-schema", "Validate response to a JSON schema")
    ]
    v(card-gap)
    section(title: "Keyboard Shortcuts", icon: "", accent: colors.indigo, tint: tints.indigo)[
      #section-intro([Inside Claude you can use these keyboard shortcuts.], tint: tints.indigo)
      #entry("Ctrl+C", "Stop current response")
      #entry("Ctrl+D", "Exit Claude")
      #entry("Ctrl+L", "Clear terminal screen")
      #entry("Ctrl+R", "Search earlier prompts")
      #entry("Ctrl+G", "Open prompt in editor")
      #entry("Ctrl+O", "Transcript mode")
      #entry("Shift+Tab", "Toggle plan mode")
      #entry("Alt+P", "Switch model")
      #entry("Alt+T", "Toggle deeper thinking")
      #entry("Esc", "Stop, rewind, or summarize")
      #entry("\\ + Enter", "Insert newline")
    ]
  },

  // Column 2
  {
    section(title: "Slash Commands", icon: "", accent: colors.violet, tint: tints.violet)[
      #section-intro([Type a slash command to manage sessions, control behavior, and access tools.], tint: tints.violet)
      #subsection("Session", accent: colors.violet)[
        #entry("/clear", "Clear current conversation")
        #entry("/resume", "Open or switch sessions")
        #entry("/rename", "Rename current session")
        #entry("/rewind", "Step back in conversation")
        #entry("/copy", "Copy response")
        #entry("/export", "Export conversation")
      ]
      #v(0.8mm)
      #subsection("Control", accent: colors.violet)[
        #entry("/model", "Set model")
        #entry("/effort", "Set effort level")
        #entry("/plan", "Enter plan (read-only) mode")
        #entry("/permissions", "View/update approvals")
        #entry("/context", "Check context usage")
        #entry("/compact [focus]", "Compress context")
        #entry("/cost", "Show token/cost usage")
        #entry("/help", "Show command reference")
      ]
      #v(0.8mm)
      #subsection("Tools & Extras", accent: colors.violet)[
        #entry("/mcp", "Manage MCP connections")
        #entry("/skills", "List available skills")
        #entry("/memory", "Edit memory files")
        #entry("/agents", "Manage agents")
        #entry("/add-dir", "Add working directory")
        #entry("/fast", "Turn on fast mode ($$)")

      ]
    ]
  },

  // Column 3
  {
    section(title: "MCP", icon: "", accent: colors.purple, tint: tints.purple)[
      #section-intro([MCP connects Claude to external tools and data services.], tint: tints.purple)
      #entry("/mcp", "Open MCP manager")
      #entry("claude mcp list", "List configured servers")
      #entry("claude mcp add ...", "Add a server")
      #entry("claude mcp remove <name>", "Remove a server")
    ]
  },

  // Column 4
  {
    section(title: "Skills", icon: "", accent: colors.emerald, tint: tints.emerald)[
      #section-intro([Skills are reusable instruction packs Claude can invoke.], tint: tints.emerald)
      #entry("/skills", "List available skills")
      #entry(".claude/skills/<name>/", "Project skill location")
      #entry("~/.claude/skills/<name>/", "Personal skill location")
    ]
    v(card-gap)
    section(title: "Agents", icon: "", accent: colors.cyan, tint: tints.cyan)[
      #section-intro([Agents are pre-configured helpers you can delegate tasks to.], tint: tints.cyan)
      #entry("/agents", "Open/manage available agents")
      #entry("--agent <name>", "Launch Claude with a specific agent")
      #entry("Explore", "Fast read-only helper")
      #entry("Plan", "Planning/research helper")
      #entry("General", "Default full-capability helper")
    ]
    v(card-gap)
    section(title: "Memory", icon: "", accent: colors.amber, tint: tints.amber)[
      #section-intro([Memory files guide persistent behavior and context.], tint: tints.amber)
      #entry("/memory", "Edit memory quickly")
      #entry("./CLAUDE.md", "Project shared memory")
      #entry("~/.claude/CLAUDE.md", "Personal default memory")
      #entry("@file", "Attach file context in prompt")
    ]
    v(card-gap)
    section(title: "Auth", icon: "", accent: colors.rose, tint: tints.rose)[
      #section-intro([Use auth commands to sign in, verify access, and fix account issues.], tint: tints.rose)
      #entry("claude auth login", "Sign in")
      #entry("claude auth status", "Check sign-in status")
      #entry("claude auth logout", "Sign out")
      #entry("claude update", "Check for updates")
      #entry("claude doctor", "Run health check")
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Single-page draft for review"
)
