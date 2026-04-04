// Claude Code Cheat Sheet — single-page non-developer draft

#import "../lib/cheatsheet.typ": *

#let theme-name = sys.inputs.at("theme", default: "paper_garden")
#let selected-theme = theme-from-name(theme-name)

#show: cheatsheet.with(
  title: "Claude Code",
  theme: selected-theme,
  col-count: 4,
)

#let tutorial-head(body) = context {
  let th = theme-state.at(here())
  text(size: body-size, weight: "semibold", fill: th.ui.text-primary, body)
}
#let tutorial-body(body) = context {
  let th = theme-state.at(here())
  text(size: body-size, fill: th.ui.text-muted, body)
}

#page-title("Claude Code Cheat Sheet", subtitle: "Single-Page Draft — Non-Developer Focus")
#v(card-gap)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: card-gap,

  // Column 1
  {
    section(title: "Launching", kind: "blue")[
      #section-intro([You launch Claude from your terminal/shell by typing one of these.])
      #entry("claude", "Start interactive session")
      #entry("claude \"prompt\"", "Start with a prompt")
      #entry("claude -p \"prompt\"", "Respond to a prompt and exit immediately")
    ]
    v(card-gap)
    section(title: "Flags", kind: "slate")[
      #section-intro([Add flags to your `claude` command to change how Claude runs and is configured.])
      #entry-flow("-p, --print", "One-shot answer and exit")
      #entry-flow("--continue", "Continue latest session in dir")
      #entry-flow("--resume", "Browse/resume sessions")
      #entry-flow("--model", "Choose model")
      #entry-flow("--effort", "Set effort (low|medium|high|max)")
      #entry-flow("--allowedTools", "Pre-approve allowed tools")
      #entry-flow("--max-turns", "Limit agent turn count")
      #entry-flow("--chrome", "Enable control of Chrome")
      #entry-flow("--output-format json", "Structured output")
      #entry-flow("--json-schema", "Constrain response to JSON schema with certain fields")
      #entry-flow("--dangerously-skip-permissions", "Allow Claude to act without confirmation")
    ]
    v(card-gap)
    section(title: "Keyboard Shortcuts", kind: "indigo")[
      #section-intro([Inside Claude you can use these keyboard shortcuts.])
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
    section(title: "Auth", kind: "rose")[
      #section-intro([Use auth commands to sign in, verify access, and fix account issues.])
      #entry("claude auth login", "Sign in")
      #entry("claude auth status", "Check sign-in status")
      #entry("claude auth logout", "Sign out")
      #entry("claude update", "Check for updates")
      #entry("claude doctor", "Run health check")
    ]
  },

  // Column 2
  {
    section(title: "Slash Commands", kind: "violet")[
      #section-intro([Type a slash command to manage sessions, control behavior, and access tools.])
      #subsection("Session")[
        #entry("/clear", "Clear current conversation")
        #entry("/resume", "Open or switch sessions")
        #entry("/rename", "Rename current session")
        #entry("/rewind", "Step back in conversation")
        #entry("/copy", "Copy response")
        #entry("/export", "Export conversation")
      ]
      #v(0.8mm)
      #subsection("Control")[
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
      #subsection("Tools & Extras")[
        #entry("/mcp", "Manage MCP connections")
        #entry("/skills", "List available skills")
        #entry("/memory", "Edit memory files")
        #entry("/agents", "Manage agents")
        #entry("/add-dir", "Add working directory")
        #entry("/fast", "Turn on fast mode ($$)")

      ]
    ]
    v(card-gap)
    section(title: "Memory", kind: "amber")[
      #section-intro([Memory has two parts: #code("CLAUDE.md") instructions you write, and auto-memory notes Claude writes from your corrections.])

      #tutorial-head[How to use]
      #tutorial-body[Use #code("/init") to scaffold a starter memory file, and #code("/memory") to review/edit what Claude is loading.]
      #v(0.6mm)

      #tutorial-head[Where instruction files live]
      #tutorial-body[Project shared instructions:]
      #path-line("./CLAUDE.md or ./.claude/CLAUDE.md").
      #tutorial-body[Personal defaults for all projects:]
      #path-line("~/.claude/CLAUDE.md").
      #tutorial-body[Personal project-only overrides (usually gitignored):]
      #path-line("./CLAUDE.local.md").
      #v(0.6mm)

      #tutorial-head[Auto-memory location]
      #tutorial-body[Auto-memory is stored per project/worktree under:]
      #path-line("~/.claude/projects/<project>/memory/")
      #v(0.6mm)

      #tutorial-head[Practical tips]
      #tutorial-body[Keep each #code("CLAUDE.md") short (around 200 lines max), use #code("@file") imports for references, and move occasional workflows into skills so always-loaded memory stays lean.]
    ]
  },


  // Column 4
  {
    section(title: "MCP", kind: "purple")[
      #section-intro([MCP connects Claude to external tools and data services.])
      #entry("/mcp", "Open MCP manager")
      #entry("claude mcp list", "List configured servers")
      #entry("claude mcp add ...", "Add a server")
      #entry("claude mcp remove <name>", "Remove a server")
    ]
    v(card-gap)
    section(title: "Skills", kind: "emerald")[
      #section-intro([Skills are reusable playbooks Claude can load automatically or run directly as slash commands.])

      #tutorial-head[How to use]
      #tutorial-body[Use #code("/skills") to list what is available, then run one with #code("/<skill-name> [args]").]
      #v(0.6mm)

      #tutorial-head[Where they live]
      #tutorial-body[Project-specific skills live in:]
      #path-line(".claude/skills/<skill>/SKILL.md")
      #tutorial-body[Personal skills across all projects live in:]
      #path-line("~/.claude/skills/<skill>/SKILL.md")
      #v(0.6mm)

      #tutorial-head[How Claude picks skills]
      #tutorial-body[Claude also auto-invokes skills when your request matches the skill #code("description") in #code("SKILL.md").]
      #v(0.6mm)

      #tutorial-head[Skill file basics]
      #tutorial-body[A skill folder needs #code("SKILL.md") with frontmatter like #code("name") and #code("description"); optional files can store templates, examples, and scripts.]
    ]
    v(card-gap)
    section(title: "Agents", kind: "cyan")[
      #section-intro([Agents are specialized subassistants with their own prompt, tools, and permissions. Claude can auto-delegate based on each agent's description.])

      #tutorial-head[How to use]
      #tutorial-body[Use #code("/agents") to create and manage agents.]
      #v(0.6mm)

      #tutorial-head[Where they live]
      #tutorial-body[Project-specific agents live in:]
      #path-line(".claude/agents/<name>.md")
      #tutorial-body[Personal agents across all projects live in:]
      #path-line("~/.claude/agents/<name>.md")
      #v(0.6mm)

      #tutorial-head[How to reference]
      #tutorial-body[Use #code("@agent-<name>") to run one task with that agent, or #code("--agent <name>") to run the whole session as that agent.]
      #v(0.6mm)

      #tutorial-head[Built-ins]
      #tutorial-body[#code("Explore") read-only search, #code("Plan") planning research, #code("General") full-capability helper.]
    ]
  },
  // Column 3
  {
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Theme: " + selected-theme.name
)
