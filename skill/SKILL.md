---
name: agent-harness-setup
description: Interactive walkthrough that builds the user's agent harness — Personalisation (~/.claude/CLAUDE.md), Context (project CLAUDE.md), Memory (~/.claude/memory/), Skills (~/.claude/skills/), Agents (~/.claude/agents/), and suggested MCP connectors. Use when the user asks to "set up my agent harness", "build my CLAUDE.md from scratch", "scaffold ~/.claude/", "install the harness starter", or follows the MarTech AI newsletter setup.
---

# Agent Harness Setup

This skill walks the user through installing the six-component agent harness from the MarTech AI newsletter. It is the interactive companion to the `agent-harness-starter` repo.

The user runs the skill, you ask the setup questions, you write the files. Charlie's directive: ask in plain prose, not the AskUserQuestion picker (`feedback_no_question_picker`).

## Step 1 — Ask which path

Open with:

> Welcome to the agent harness setup. Two paths:
>
> 1. **Global harness** — your personal `~/.claude/` directory (Personalisation, Memory, Skills, Agents). Recommended first time.
> 2. **Project harness** — a `CLAUDE.md` for a specific project you're already inside.
>
> Which would you like?

If global → Step 2. If project → Step 7.

## Step 2 — Global setup, pre-flight

Run `bash skill/scripts/setup.sh` (relative to wherever the repo was cloned). This creates:

```
~/.claude/CLAUDE.md            (empty, populated next)
~/.claude/memory/MEMORY.md     (index template)
~/.claude/skills/              (empty)
~/.claude/agents/              (empty)
```

If `~/.claude/CLAUDE.md` already exists, ask the user before overwriting. Default: rename existing to `CLAUDE.md.backup-{timestamp}` and continue.

## Step 3 — Personalisation interview

Ask the user, one block at a time, in plain prose:

1. **Your role and what you do.** "Who are you and what do you spend your time on? One paragraph."
2. **Your voice.** "How do you write? British or US English? Long sentences or short? Any punctuation you ban (em dashes, semicolons)? Any words you ban (leverage, tapestry, deep dive)?"
3. **Your output defaults.** "What format do you want answers in by default? Markdown? Plain text? Save to file?"
4. **Your workflow rules.** "When should I plan before executing? When should I ask vs. just go? How do I handle corrections?"
5. **The audience for your work.** "Who reads what you ship? Marketers? Engineers? Founders?"

After all five, draft the global `CLAUDE.md` based on the template at `templates/CLAUDE.md` with the user's answers filled in. Show it to them, ask for edits, then save to `~/.claude/CLAUDE.md`.

## Step 4 — Memory bootstrap

Copy `templates/memory/MEMORY.md` to `~/.claude/memory/MEMORY.md` if it doesn't exist. Copy `templates/memory/feedback_example.md` to `~/.claude/memory/feedback_example.md` as a reference.

Tell the user:

> Memory is where every correction becomes a permanent rule. The pattern is:
>
> 1. I make a mistake.
> 2. You say "remember this: [rule]".
> 3. I write `~/.claude/memory/feedback_[name].md` and add a line to `MEMORY.md`.
> 4. Next session, the rule loads automatically.
>
> Charlie's folder has 135 of these.

## Step 5 — Skills bootstrap

Copy `templates/skills/post-writer-example/` to `~/.claude/skills/post-writer-example/`.

Tell the user:

> Skills are saved workflows you fire by name. The `post-writer-example` is a starter — open it, see how a `SKILL.md` is structured, then save your own once a workflow runs cleanly.

## Step 6 — Agents bootstrap

Copy `templates/agents/{strategist,builder,qa-scorer}.md` to `~/.claude/agents/`.

Tell the user:

> Agents are specialists you delegate to. The three templates cover the most common pipeline: a strategist that decides what to build, a builder that ships it, a qa-scorer that gates quality. Rename or duplicate them for your own workflow.

Then offer:

> Want me to set up an agent team for a specific workflow you run? Describe the workflow and I'll write the role files.

## Step 7 — Project setup (if user chose project path in Step 1)

Ask:

1. "What's the project?" (purpose, audience, output destination)
2. "Voice or tone for this project — does it differ from your global default?"
3. "Reference files I should pull from? (brand kit, past examples, voice files)"
4. "Output format — file? Notion page? Substack draft?"
5. "Any banned words or required phrases specific to this project?"

Draft a project-level `CLAUDE.md` based on `templates/project-CLAUDE.md`. Save to `<project-root>/CLAUDE.md`. Show to user, ask for edits.

## Step 8 — MCP connectors

Ask:

> Want suggestions for which MCP connectors to wire up? I'll list the most common ones and explain how to install each.

If yes, list:

- **Gmail** — read + send mail
- **Notion** — read + write pages
- **Slack** — read channels + send messages
- **Google Drive** — read + create files
- **Linear** — read + create issues
- **Granola** — read meeting notes

For each one the user picks, explain the install path:

> Tell me in this session "connect to [tool]" and I'll walk you through the OAuth setup.

Flag Charlie's note: focus on the tools the user already lives in. Five well-chosen connectors beat twenty unused ones.

## Step 9 — Wrap

Show what's installed:

> Your harness is live:
>
> - Global CLAUDE.md at `~/.claude/CLAUDE.md` ✓
> - Memory index at `~/.claude/memory/MEMORY.md` ✓
> - Skills folder at `~/.claude/skills/` (with starter example) ✓
> - Agents folder at `~/.claude/agents/` (with 3 starter roles) ✓
>
> Next:
>
> 1. Read the full discipline in the MarTech AI newsletter: [link]
> 2. Save every correction as a memory file from here on
> 3. Once a workflow runs cleanly, save it as a Skill
>
> When you mess up, tell me, and I'll route the fix to the right place.

## Non-negotiables

- **Plain prose questions, no AskUserQuestion picker.** Charlie's preference; respect it.
- **Backup before overwrite.** Never silently overwrite existing `~/.claude/` files.
- **Show drafts before saving.** Always let the user edit before the file lands on disk.
- **British English** in all generated copy unless the user specifies otherwise.
