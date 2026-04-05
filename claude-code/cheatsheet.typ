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

#let tip(lead, body) = context {
  let th = theme-state.at(here())
  block(above: 1.6mm, below: 0mm)[
    #text(size: body-size, weight: "bold", fill: th.ui.text-primary, lead)
    #h(0.3mm)
    #text(size: body-size, fill: th.ui.text-muted, body)
  ]
}

#let title-card() = context {
  let th = theme-state.at(here())
  block(
    width: 100%,
    radius: card-radius,
    inset: (x: 2.5mm, y: 2mm),
  )[
    #block(width: 100%)[
      #place(right + horizon, dx: 6mm, dy: 3mm, image("../assets/clawd-mini.svg", width: 18mm))
      #let title = text(font: "Anthropic Serif Web Text", size: 22pt, weight: 800, fill: th.ui.text-primary)[Claude Code]
      #let subtitle = text(font: "Anthropic Sans Web Text", size: 7pt, weight: 300, tracking: 1pt, fill: th.ui.text-muted)[Cheat Sheet · April 2026]
      #let tw = measure(title).width
      #box(width: tw)[
        #title
        #v(-0.3em)
        #align(center, subtitle)
      ]
    ]
  ]
}

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: card-gap,

  // Column 1
  {
    section(title: "Launching", kind: "blue")[
      #section-intro([You launch Claude from your terminal/shell by typing one of these.])
      #entry-flow("claude", "Start interactive session")
      #entry-flow("claude \"prompt\"", "Start with a prompt")
      #entry-flow("claude -p \"prompt\"", "Respond to a prompt and exit immediately")
    ]
    v(card-gap)
    section(title: "Flags", kind: "orange")[
      #section-intro([Add flags to your `claude` shell command to change how Claude runs.])
      #entry-flow("-p, --print", "One-shot answer and exit")
      #entry-flow("--continue", "Continue latest session in dir")
      #entry-flow("--resume", "Browse and resume sessions")
      #entry-flow("--model", "Choose model")
      #entry-flow("--effort", "Set effort (low|medium|high|max)")
      #entry-flow("--allowedTools", "Pre-approve allowed tools")
      #entry-flow("--max-turns", "Limit agent turn count")
      #entry-flow("--chrome", "Enable control of Chrome")
      #entry-flow("--output-format json", "Structured output")
      #entry-flow("--json-schema", "Constrain response to JSON schema with certain fields")
      #entry-flow("--dangerously-skip-permissions", "Allow Claude to act without confirmation (YOLO)")
      #entry-flow("--enable-auto-mode", "Near-YOLO with protection against dangerous actions")
    ]
    v(card-gap)
    section(title: "Keyboard Shortcuts", kind: "teal")[
      #section-intro([Inside Claude you can hit these key combos to control Claude])
      #entry-flow("Ctrl+C", "Stop current response")
      #entry-flow("Ctrl+D", "Exit Claude session")
      #entry-flow("Ctrl+L", "Clear terminal screen")
      #entry-flow("Ctrl+R", "Search earlier prompts")
      #entry-flow("Ctrl+G", "Open prompt in \$EDITOR")
      #entry-flow("Ctrl+O", "Verbose transcript mode")
      #entry-flow("Ctrl+V", "Paste image from clipboard")
      #entry-flow("Shift+Tab", "Cycle permission modes")
      #entry-flow("Alt+P", "Switch model mid-session")
      #entry-flow("Alt+T", "Toggle deeper thinking")
      #entry-flow("Esc", "Stop, rewind, or summarize")
      #entry-flow("\\ + Enter", "Insert newline")
      #entry-flow("@ + filename", "Mention/autocomplete a file")
      #entry-flow("!", "Run a shell command directly")
    ]
    v(card-gap)
    section(title: "MCP", kind: "rose")[
      #section-intro([
        Model Context Protocol tools connect Claude to external services and APIs.
        Prefer CLIs if possible. You can connect ChatGPT to Claude via MCP and have
        models consult each other.
      ])
      #entry-flow("/mcp", "Open MCP manager")
      #entry-flow("claude mcp list", "List configured servers")
      #entry-flow("claude mcp add ...", "Add a server")
      #entry-flow("claude mcp remove <name>", "Remove a server")

    ]
  },

  // Column 2
  {
    section(title: "Slash Commands", kind: "violet")[
      #section-intro([Type a slash command to manage sessions, control behavior, and access tools.])
      #subsection("Session", kind: "violet")[
        #entry-flow("/clear", "Clear current conversation")
        #entry-flow("/resume", "Open or switch sessions")
        #entry-flow("/rename", "Rename current session")
        #entry-flow("/rewind", "Step back in conversation")
        #entry-flow("/copy", "Copy last response to clipboard")
        #entry-flow("/export", "Export conversation to file")
        #entry-flow("/login", "Use your Claude subscription")
        #entry-flow("/logout", "Uh...logout")
        #entry-flow("/branch", "Branch conversation; return later")
        #entry-flow("/diff", "Show git diff for current session")
      ]
      #subsection("Control", kind: "violet")[
        #entry-flow("/model", "Set model for session")
        #entry-flow("/effort", "Set thinking effort level")
        #entry-flow("/plan", "Enter plan (read-only) mode")
        #entry-flow("/permissions", "View/update approvals")
        #entry-flow("/context", "Check context window usage")
        #entry-flow("/compact [focus]", "Compress context")
        #entry-flow("/cost", "Show token/cost usage")
        #entry-flow("/help", "Show command reference")
        #entry-flow("/init", "Scaffold starter CLAUDE.md")
        #entry-flow("/hooks", "Manage deterministic hooks")
      ]
      #subsection("Tools & Extras", kind: "violet")[
        #entry-flow("/mcp", "Manage MCP server connections")
        #entry-flow("/skills", "List and run available skills")
        #entry-flow("/memory", "Edit CLAUDE.md memory files")
        #entry-flow("/agents", "Create and manage agents")
        #entry-flow("/add-dir", "Add extra working directory")
        #entry-flow("/fast", "Turn on fast mode ($$)")
        #entry-flow("/btw <question>", "Quick overlay answer (no context cost)")

      ]
    ]
    v(card-gap)
    section(title: "Memory", kind: "slate")[
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
      #tutorial-body[Keep #code("CLAUDE.md") short (under 200 lines), use #code("@file") imports, and move occasional workflows into skills so memory stays lean.]
    ]
  },


  // Column 3
  {
    section(title: "Skills", kind: "amber")[
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
      #v(0.6mm)

      #tutorial-head[Built-in skills]
      #tutorial-body[#code("/simplify") refactor code, #code("/batch") run across files, #code("/debug [desc]") debug with a plan, #code("/loop [interval]") repeat a task on a schedule, #code("/claude-api") help with Claude API usage.]
      #v(0.6mm)

      #tutorial-head[Frontmatter fields]
      #tutorial-body[#code("name:") display name, #code("description:") when to auto-invoke, #code("trigger:") slash command name, #code("paths:") files to auto-load. Place supporting files (scripts, templates, examples) alongside #code("SKILL.md").]
      #v(0.6mm)

      #tutorial-head[Tips for great skills]
      #tutorial-body[Write skills for repeated workflows: deploy, review, test. Keep each focused on one task. Include example invocations. Use #code("@file") to pull in templates.]
    ]
    v(card-gap)
    section(title: "Agents", kind: "emerald")[
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
      #tutorial-body[#code("Explore") read-only codebase search, #code("Plan") planning and research (no edits), #code("General") full-capability helper, #code("Bash") shell specialist.]


      #v(0.6mm)


      #v(0.6mm)


    ]
  },

  // Column 4
  {
    title-card()
    v(card-gap)
    section(title: "Tips", kind: "cyan")[
      #tip("Use plan mode.", [
          The machine cannot read your mind (yet). Make darn sure it knows what you want before you turn it loose. Explore, plan, then implement.
      ])
      #tip("Lean hard on Skills.", [
          Did Claude screw up then figure it out? Preserve lessons learned by updating existing or adding new skills. Claude approaches awesome asymptotically.
      ])
      #tip("Bring your own knowledge.", [
          The LLM is a thinking machine, not a fact machine. Give it papers, documents, APIs, search tools. Force it to get live data you trust.
      ])
      #tip("Build named agents.", [
          Want to chat with Daniel Kahneman? Have Claude research and write a Kahneman agent. Encode domain expertise as reusable personas.
      ])
      #tip("Give Claude a way to check itself.", [
          Tests, linters, expected outputs. Anthropic calls this the single highest-leverage thing you can do.
      ])
      #tip("Context is your \#1 resource.", [
          File reads, command outputs, conversation — it all eats context. Performance degrades as it fills. Treat it like money.
      ])
      #tip("Two strikes, start over.", [
          Corrected Claude twice on the same issue? Context is polluted. ESC to rewind or \/clear and rewrite your prompt.
      ])
      #tip("/clear or /compact between tasks.", [
          Leftover context from a different task confuses Claude. Start fresh or use #code("/compact focus on X") to keep relevant parts.
      ])
      #tip("Let Claude interview you.", [
          Say "interview me about this." Claude asks about edge cases and tradeoffs you haven't considered.
      ])
      #tip("Delegate to subagents.", [
          Keep your main agent focused by delegating research and tangential work. Fresh context = better results.
      ])
      #tip("Point to code you like.", [
          Old projects, existing patterns. Claude follows conventions better when shown, not told. Use #code("@file") to reference.
      ])
      #tip("/btw for quick questions.", [
          Overlay answer, never enters history. Zero context cost.
      ])
      #tip("Use git. Commit early and often.", [
          Small commits are easy to revert. Big ones are archeology. Commit after each logical unit.
      ])
      #tip("Use the right model.", [
          Sonnet handles most tasks well and saves quota. Save Opus for hard reasoning problems.
      ])



    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Theme: " + selected-theme.name
)
