# CLAUDE.md

Global rules for Claude Code. Loaded into every session, every project.

## Who I am

- [Your name and what you do — one line]
- [Your company or role]
- [Your audience or who you write for]
- [Anything else worth knowing: follower counts, areas of expertise, current products]

## How I write

- [British or US English spelling]
- [Sentence length: short / long / variable]
- [Punctuation you ban: em dashes, semicolons, exclamation marks]
- [Words you ban: leverage, deep dive, unlock, game-changer, tapestry, landscape, notably, furthermore]
- [Openers you ban: "In today's world", "It's no secret that"]
- [Section endings you ban: motivational summaries, "remember,..."]

## Output defaults

- [Default file format — markdown, plain text, code blocks]
- [Where to save by default — current dir, ~/Desktop/, specific project folder]
- [Date format — DD/MM/YYYY or MM/DD/YYYY, time zone]
- [When to ask vs. just go — confidence threshold]

## Workflow rules

- Plan before executing any non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately
- After ANY correction: write the rule to `~/.claude/memory/feedback_[name].md` and add to MEMORY.md
- Verify before claiming done — never mark complete without proving it works
- Use subagents liberally to keep the main context clean

## Task management

1. **Plan first** — write the plan to `tasks/todo.md` (per project) with checkable items
2. **Verify plan** — check in before starting implementation
3. **Track progress** — mark items complete as you go
4. **Document results** — review section in `tasks/todo.md` when done
5. **Capture lessons** — update memory after corrections

## Core principles

- **Simplicity first** — minimal code impact, smallest viable change
- **No laziness** — find root causes, no temporary fixes
- **Minimal blast radius** — touch only what's necessary

## Projects and commands

[List your active projects with their paths and key commands. Examples:]

```
~/project-one/         npm run dev    (Next.js site)
~/project-two/         npm start      (Express API)
~/project-three/       node main.js   (CLI tool)
```

## Tools I use daily

[List MCP connectors you have wired up. Examples:]

- Gmail (read + send)
- Notion (read + write)
- Slack (read + send)
- Google Drive (read + create)
- Granola (read meeting notes)
