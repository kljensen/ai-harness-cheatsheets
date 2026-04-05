# Tips Draft for Cheatsheet

These are organized roughly by importance. Pick what fits.
The tone targets your style: direct, opinionated, non-developer-friendly.

---

## Alignment & Planning

**Use plan mode.**
The machine cannot read your mind.
Make achieving mental alignment your #1 priority.
Make darn sure it knows what you want before you
turn it loose.

**Let Claude interview you.**
For big features, say "interview me about this."
Claude will ask about edge cases and tradeoffs
you haven't thought of yet. Way better than
guessing what to specify upfront.

**Explore, plan, implement, commit.**
Four phases. Don't let Claude jump straight to
code. Explore in plan mode, agree on the approach,
*then* switch to normal mode and build.

**Skip the plan for small stuff.**
If you can describe the diff in one sentence,
just ask Claude to do it. Planning has overhead.
Save it for when you're uncertain or touching
many files.

## Verification & Quality

**Give Claude a way to check itself.**
Tests, screenshots, linters, expected outputs —
anything. This is the single highest-leverage
thing you can do. Without it, *you* are the
only feedback loop.

**Say "write a failing test first, then fix it."**
This one prompt pattern prevents more bugs than
any amount of careful instruction. Claude proves
the bug exists before attempting a fix.

**Don't trust plausible-looking output.**
Claude can produce code that reads perfectly
and doesn't work. If you can't verify it,
don't ship it.

## Context Management

**Context is your #1 resource.**
Everything you do eats context: file reads,
command outputs, conversation. Performance
degrades as it fills. Treat context like money.

**/clear between unrelated tasks.**
Long sessions with leftover context from
a different task are where Claude gets confused.
Start fresh. It's free.

**Use /compact when sessions get long.**
Add a focus hint: `/compact focus on the API changes`.
This tells Claude what to preserve when
summarizing.

**Delegate research to subagents.**
When Claude explores a codebase it reads tons of
files, eating your context. Say "use a subagent
to investigate X." It explores separately and
reports back a summary.

## Memory & Skills

**Lean hard on Skills.**
Did Claude screw up and then ultimately figure
it out? Preserve your lessons learned in a skill.
Claude will approach awesome asymptotically.

**Keep CLAUDE.md ruthlessly short.**
For every line, ask: would removing this cause
Claude to make mistakes? If not, cut it.
Bloated memory files get ignored.

**Put rarely-needed knowledge in skills, not CLAUDE.md.**
CLAUDE.md loads every session. Domain knowledge
that only matters sometimes should be a skill
so it loads on demand.

**Treat CLAUDE.md like code.**
Check it into git. Review it when Claude
misbehaves. Prune it regularly. It compounds
in value over time.

## Agents & Delegation

**Build named agents.**
Do you want to chat with Daniel Kahneman about
behavioral economics? Have Claude research and
write a Kahneman agent.

**Use a writer/reviewer pattern.**
Have one session implement, another review.
Fresh context means honest feedback — Claude
won't be biased toward code it just wrote.

**Fan out across files.**
Big migration? Loop `claude -p` over a file list.
Test on 2–3 files, refine the prompt, then
run the full batch.

## Course Correction

**Correct early. Two strikes, start over.**
If you've corrected Claude twice on the same
issue, the context is polluted with failed
approaches. /clear and write a better prompt
with what you learned.

**Esc is your best friend.**
Tap Esc to stop Claude mid-action. Tap Esc
twice to open the rewind menu. Context is
preserved — you can redirect without starting
over.

**Rewind freely.**
Every action is checkpointed. You can restore
conversation, code, or both. Try risky things
knowing you can always roll back.

## Prompting

**Be specific, not vague.**
"Fix the login bug" → "Users report login fails
after session timeout. Check src/auth/, especially
token refresh. Write a failing test, then fix it."

**Point to patterns in your codebase.**
"Look at how HotDogWidget works, then follow
that pattern to build CalendarWidget." Claude
follows existing conventions better when shown.

**Use @ to reference files.**
Don't describe where code lives. Use @filename
and Claude reads it directly. Less ambiguity,
less context wasted.

**Paste screenshots and images.**
Claude can see. Paste a design, a bug screenshot,
or an error dialog. "Implement this design.
Screenshot the result and compare."

## Environment & Tools

**Install the gh CLI.**
Claude knows GitHub's CLI natively. Without it,
API calls hit rate limits. With it: issues, PRs,
comments — all seamless.

**Use CLI tools over APIs.**
`gh`, `aws`, `gcloud`, `sentry-cli` — tell Claude
to learn unfamiliar CLIs with `--help`. Way more
context-efficient than raw API calls.

**Set up hooks for non-negotiables.**
Unlike CLAUDE.md (advisory), hooks are
deterministic. "Write a hook that runs eslint
after every file edit." Zero exceptions.

**Connect MCP servers.**
Notion, Figma, databases, monitoring —
MCP lets Claude reach outside your codebase
into the tools you actually use.

## Workflow & Scaling

**Commit often.**
"Commit with a descriptive message" after each
logical unit. Small commits are easy to revert.
Big ones are archeology.

**Use /btw for quick questions.**
Need a quick answer without polluting context?
/btw shows the answer in an overlay that never
enters conversation history.

**Run parallel sessions.**
One Claude implements, another reviews.
Or fan out work across worktrees.
You're not limited to one conversation.

**Name your sessions.**
`/rename oauth-migration` so you can find and
resume them later. Treat sessions like branches.

**Use auto mode for batch work.**
`--permission-mode auto` lets a safety classifier
handle approvals. Great for unattended runs
like fixing all lint errors.
