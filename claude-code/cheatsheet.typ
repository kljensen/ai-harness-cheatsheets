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
    v(card-gap)
    section(title: "Memory", icon: "", accent: colors.amber, tint: tints.amber)[
      #section-intro([Memory has two parts: #code("CLAUDE.md") instructions you write, and auto-memory notes Claude writes from your corrections.], tint: tints.amber)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[How to use]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Use #code("/init") to scaffold a starter memory file, and #code("/memory") to review/edit what Claude is loading.]
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Where instruction files live]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Project shared instructions:]
      #path-line("./CLAUDE.md or ./.claude/CLAUDE.md")
      #text(size: body-size, fill: rgb("#5F6B7A"))[Personal defaults for all projects:]
      #path-line("~/.claude/CLAUDE.md")
      #text(size: body-size, fill: rgb("#5F6B7A"))[Personal project-only overrides (usually gitignored):]
      #path-line("./CLAUDE.local.md")
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Auto-memory location]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Auto-memory is stored per project/worktree under:]
      #path-line("~/.claude/projects/<project>/memory/")
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Practical tips]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Keep each #code("CLAUDE.md") short (around 200 lines max), use #code("@file") imports for references, and move occasional workflows into skills so always-loaded memory stays lean.]
    ]
  },


  // Column 4
  {
    section(title: "MCP", icon: "", accent: colors.purple, tint: tints.purple)[
      #section-intro([MCP connects Claude to external tools and data services.], tint: tints.purple)
      #entry("/mcp", "Open MCP manager")
      #entry("claude mcp list", "List configured servers")
      #entry("claude mcp add ...", "Add a server")
      #entry("claude mcp remove <name>", "Remove a server")
    ]
    v(card-gap)
    section(title: "Skills", icon: "", accent: colors.emerald, tint: tints.emerald)[
      #section-intro([Skills are reusable playbooks Claude can load automatically or run directly as slash commands.], tint: tints.emerald)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[How to use]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Use #code("/skills") to list what is available, then run one with #code("/<skill-name> [args]").]
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Where they live]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Project-specific skills live in:]
      #path-line(".claude/skills/<skill>/SKILL.md")
      #text(size: body-size, fill: rgb("#5F6B7A"))[Personal skills across all projects live in:]
      #path-line("~/.claude/skills/<skill>/SKILL.md")
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[How Claude picks skills]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Claude also auto-invokes skills when your request matches the skill #code("description") in #code("SKILL.md").]
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Skill file basics]
      #text(size: body-size, fill: rgb("#5F6B7A"))[A skill folder needs #code("SKILL.md") with frontmatter like #code("name") and #code("description"); optional files can store templates, examples, and scripts.]
    ]
    v(card-gap)
    section(title: "Agents", icon: "", accent: colors.cyan, tint: tints.cyan)[
      #section-intro([Agents are specialized subassistants with their own prompt, tools, and permissions. Claude can auto-delegate based on each agent's description.], tint: tints.cyan)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[How to use]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Use #code("/agents") to create and manage agents.]
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Where they live]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Project-specific agents live in:]
      #path-line(".claude/agents/<name>.md")
      #text(size: body-size, fill: rgb("#5F6B7A"))[Personal agents across all projects live in:]
      #path-line("~/.claude/agents/<name>.md")
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[How to reference]
      #text(size: body-size, fill: rgb("#5F6B7A"))[Use #code("@agent-<name>") to run one task with that agent, or #code("--agent <name>") to run the whole session as that agent.]
      #v(0.6mm)

      #text(size: body-size, weight: "semibold", fill: rgb("#1F2937"))[Built-ins]
      #text(size: body-size, fill: rgb("#5F6B7A"))[#code("Explore") read-only search, #code("Plan") planning research, #code("General") full-capability helper.]
    ]
  },
  // Column 3
  {
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Single-page draft for review"
)
