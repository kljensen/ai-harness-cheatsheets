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
      #place(right + horizon, dx: 6mm, dy: 4mm, image("../assets/clawd-mini.svg", width: 18mm))
      #text(font: "Anthropic Serif Web Text", size: 22pt, weight: 800, fill: th.ui.text-primary)[Claude Code]
      #linebreak()
      #h(1mm)
      #text(font: "Anthropic Sans Web Text", size: 10pt, weight: 300, tracking: 1pt, fill: th.ui.text-muted)[Cheat Sheet]
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
    section(title: "Flags", kind: "slate")[
      #section-intro([Add flags to your `claude` shell command to change how Claude runs.])
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
      #entry-flow("--dangerously-skip-permissions", "Allow Claude to act without confirmation (YOLO)")
      #entry-flow("--enable-auto-mode", "Near-YOLO with protection against dangerous actions")
    ]
    v(card-gap)
    section(title: "Keyboard Shortcuts", kind: "indigo")[
      #section-intro([Inside Claude you can hit these key combos to control Claude])
      #entry-flow("Ctrl+C", "Stop current response")
      #entry-flow("Ctrl+D", "Exit Claude")
      #entry-flow("Ctrl+L", "Clear terminal screen")
      #entry-flow("Ctrl+R", "Search earlier prompts")
      #entry-flow("Ctrl+G", "Open prompt in editor")
      #entry-flow("Ctrl+O", "Transcript mode")
      #entry-flow("Shift+Tab", "Toggle plan mode")
      #entry-flow("Alt+P", "Switch model")
      #entry-flow("Alt+T", "Toggle deeper thinking")
      #entry-flow("Esc", "Stop, rewind, or summarize")
      #entry-flow("\\ + Enter", "Insert newline")
    ]
    v(card-gap)
    section(title: "MCP", kind: "purple")[
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
        #entry-flow("/copy", "Copy response")
        #entry-flow("/export", "Export conversation")
        #entry-flow("/login", "Use your Claude subscription")
        #entry-flow("/logout", "Uh...logout")
        #entry-flow("/branch", "Branch off from the current conversation with ability to return")
      ]
      #subsection("Control", kind: "violet")[
        #entry-flow("/model", "Set model")
        #entry-flow("/effort", "Set effort level")
        #entry-flow("/plan", "Enter plan (read-only) mode")
        #entry-flow("/permissions", "View/update approvals")
        #entry-flow("/context", "Check context usage")
        #entry-flow("/compact [focus]", "Compress context")
        #entry-flow("/cost", "Show token/cost usage")
        #entry-flow("/help", "Show command reference")
      ]
      #subsection("Tools & Extras", kind: "violet")[
        #entry-flow("/mcp", "Manage MCP connections")
        #entry-flow("/skills", "List available skills")
        #entry-flow("/memory", "Edit memory files")
        #entry-flow("/agents", "Manage agents")
        #entry-flow("/add-dir", "Add working directory")
        #entry-flow("/fast", "Turn on fast mode ($$)")

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


  // Column 3
  {
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

  // Column 4
  {
    title-card()
    v(card-gap)
    section(title: "Tips", kind: "emerald")[
      #tip("Use plan mode.", [
          The machine cannot read your mind (yet). Make darn
          sure it knows what you want before you turn
          it loose.
      ])
      #tip("Lean hard on Skills.", [
          Did Claude screw up then figure it out?
          Preserve lessons learned by updating
          existing 
          or adding new skills.
      ])
      #tip("Bring your own knowledge.", [
          The LLM is a thinking machine, not a fact
          machine. Give it papers, documents,
          APIs, search tools. Force it to get live data
          you trust.
      ])
      #tip("Build named agents.", [
          Want to chat with Daniel Kahneman? Have
          Claude research and write a Kahneman agent.
      ])
      #tip("Give Claude a way to check itself.", [
          Tests, linters, expected outputs. Anthropic
          calls this the single highest-leverage thing.
      ])
      #tip("Context is your \#1 resource.", [
          File reads, command outputs, conversation —
          it all eats context. Performance degrades
          as it fills. Treat it like money.
      ])
      #tip("Two strikes, start over.", [
          Corrected Claude twice on the same issue?
          Context is polluted. Use ESC to rewind or
          \/clear and write
          a better prompt with what you learned.
      ])
      #tip("/clear or /compact between unrelated tasks.", [
          Leftover context from a different task is
          where Claude gets confused. Start fresh.
      ])
      #tip("Let Claude interview you.", [
          Say "interview me about this." Claude asks
          about edge cases and tradeoffs you haven't
          thought of.
      ])
      #tip("Delegate to subagents.", [
          Outsourcing works like real life. Keep your
          main agent focused by delegating the menial
          and tangential.
      ])
      #tip("Point to code you like.", [
          Old projects, existing patterns, anything.
          Claude follows conventions better when
          shown, not told.
      ])
      #tip("/btw for quick questions.", [
          Answer shows in an overlay, never enters
          conversation history. Zero context cost.
      ])
      #tip("Use git. Commit early and often.", [
          Small commits are easy to revert.
          Big ones are archeology.
      ])
      #tip("Rewind freely.", [
          Every action is checkpointed. Try risky
          things knowing you can always roll back.
      ])
      #tip("Use the right model.", [
          You don't need Opus to write a recommendation
          letter. Sonnet will crush it and eat less into
          your quota.
      ])
    ]
  },
)

#v(1fr)
#page-footer(
  "Claude Code v2.1 · " + datetime.today().display("[month repr:long] [day], [year]"),
  "Theme: " + selected-theme.name
)
