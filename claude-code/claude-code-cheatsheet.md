# Claude Code Cheat Sheet

Based on: https://cc.storyfox.cz/

## Quick Start

```bash
claude                    # interactive session
claude "question"         # start with prompt
claude -p "question"      # print / non-interactive
claude -c                 # continue last session
claude -r "name"          # resume session by name/ID
```

## Keyboard Shortcuts (from current CC sheet)

### General
- `Ctrl+C` — cancel current input/generation
- `Ctrl+D` — exit session
- `Ctrl+L` — clear screen
- `Ctrl+O` — toggle verbose/transcript
- `Ctrl+R` — reverse-search history
- `Ctrl+G` — open prompt in editor
- `Ctrl+X Ctrl+E` — open editor (alias)
- `Ctrl+B` — background running task
- `Ctrl+T` — toggle task list
- `Ctrl+V` — paste image
- `Ctrl+X Ctrl+K` — kill background agents
- `Esc Esc` — rewind or summarize

### Mode / Thinking / Input
- `Shift+Tab` — cycle permission modes
- `Alt+P` — switch model
- `Alt+T` — toggle thinking
- `Alt+O` — toggle fast mode
- `\` + `Enter` — quick newline
- `Ctrl+J` — newline via control sequence
- `/` — slash command prefix
- `!` — direct bash prefix
- `@` — file mention + autocomplete

### Session Picker / Transcript
- `↑↓` navigate
- `←→` expand/collapse
- `P` preview
- `R` rename
- `/` search
- `A` all projects
- `B` current branch

## MCP Servers

- `claude mcp` — open interactive MCP UI
- `claude mcp list` — list configured servers
- `claude mcp serve` — start CC as MCP server
- `--transport http|stdio|sse` — transport for external server config
- Scopes: `local` (`~/.claude.json`), `project` (`.mcp.json`), `user` (`~/.claude.json`)

## Slash Command Groups

### Session
- `/clear`, `/compact [focus]`, `/resume`, `/rename [name]`, `/branch [name]`
- `/cost`, `/context`, `/diff`, `/copy [N]`, `/rewind`, `/export`

### Config / Tooling
- `/config`, `/model [model]`, `/fast`, `/vim`, `/theme`, `/permissions`
- `/effort [level]`, `/color [color]`, `/keybindings`, `/terminal-setup`
- `/init`, `/memory`, `/mcp`, `/hooks`, `/skills`, `/agents`, `/chrome`
- `/reload-plugins`, `/add-dir <path>`

### Special
- `/powerup`, `/btw <question>`, `/plan [desc]`, `/loop [interval]`
- `/voice`, `/doctor`, `/pr-comments [PR]`, `/stats`, `/insights`
- `/desktop`, `/remote-control`, `/usage`, `/schedule`, `/security-review`
- `/help`, `/feedback` (alias `/bug`), `/release-notes`, `/stickers`

## Memory & Files

- `./CLAUDE.md` — project memory
- `~/.claude/CLAUDE.md` — personal memory
- `/etc/claude-code/` — managed (org-wide)
- `.claude/rules/*.md`, `~/.claude/rules/*.md`, `paths:` frontmatter, `@path/to/file`
- Auto memory: `~/.claude/projects/<project>/memory/`

## Workflows & Tips

- Plan mode flow: `Shift+Tab` (normal → auto-accept → plan), `--permission-mode plan`
- Thinking control: `Alt+T`, `/effort`
- Git worktree flags: `--worktree <name>`, `--worktree` support in sessions
- Voice mode: `/voice`, hold `Space`
- Context: `/context`, `/compact [focus]`, `/compact` can be proactive/automatic
- SDK/headless: `claude -p "query"`, `--output-format json`, `--max-budget-usd 5`
- Remote/scheduling: `/loop 5m msg`, `/rc`, `--remote`

## Config Files & Env

### Config files
- `~/.claude/settings.json`, `.claude/settings.json`, `.claude/settings.local.json`
- `~/.claude.json` (OAuth / MCP / state)
- `.mcp.json` (project MCP config)

### Useful env vars
- `ANTHROPIC_API_KEY`
- `ANTHROPIC_MODEL`
- `CLAUDE_CODE_EFFORT_LEVEL`
- `MAX_THINKING_TOKENS`
- `CLAUDE_CODE_SUBPROCESS_ENV_SCRUB`
- `CLAUDE_STREAM_IDLE_TIMEOUT_MS`
- `MCP_CONNECTION_NONBLOCKING`

## Skills & Agents

### Built-in Skills
`/simplify`, `/batch`, `/debug [desc]`, `/loop [interval]`, `/claude-api`

### Built-in Agents
`Explore`, `Plan`, `General`, `Bash` (see agent frontmatter in project docs)

## CLI / Flags (core)

- `claude` (interactive)
- `claude -p`, `claude -c`, `claude -r`, `claude update`
- `--model`, `-w` (worktree), `-n/--name`, `--add-dir`
- `--agent`, `--allowedTools`, `--output-format`, `--json-schema`
- `--max-turns`, `--max-budget-usd`, `--verbose`, `--console`, `--effort`, `--permission-mode`
- `--dangerously-skip-permissions` (dangerous), `--remote`, `--chrome`
