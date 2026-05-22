# Cowork Setup

A `SKILL.md` is a Claude Code construct, so Cowork users can't `git clone` the skill the same way. But everything else in this repo works in Cowork because it's all plain markdown.

Here's the manual walkthrough.

## 1. Personalisation

Cowork's equivalent of `~/.claude/CLAUDE.md` is **Global Instructions** in Settings.

1. Open `templates/CLAUDE.md` in this repo.
2. Replace every `[placeholder]` with your details.
3. Open Cowork Settings → find Global Instructions in the sidebar.
4. Paste the filled-in CLAUDE.md content into the box.
5. Hit save.

Cowork now loads these into every chat.

## 2. Context

Every Cowork project has a `CLAUDE.md` at the root of the mounted folder already.

1. Open `templates/project-CLAUDE.md` in this repo.
2. Fill in the placeholders for the project you're setting up.
3. Edit the existing `CLAUDE.md` at the root of your Cowork project — paste the filled-in version in.

Or just ask Claude in chat: "Update this project's CLAUDE.md with the following rules: [paste your rules]".

## 3. Action

1. Open Cowork Settings → Connectors.
2. Pick the apps you want to wire up. Start with the ones you actually live in:
   - Gmail
   - Notion
   - Slack
   - Google Drive
   - Linear (if you use it)
3. **Flip every connector from read-only to write access.** This is the step most people skip. Read-only connectors can read your data but can't finish the work.

## 4. Memory

Cowork's memory works in chat:

1. When Claude makes a mistake you want fixed permanently, tell Claude: "remember that [correction]".
2. Cowork writes the rule into your project memory automatically.
3. The rule reloads next session before Claude does anything.

To bootstrap: open `templates/memory/feedback_example.md` to see the expected format, then ask Claude to seed a few memories you already know you'll need.

## 5. Delegation

Cowork sub-agents launch automatically — no setup. The trade-off vs Claude Code is less control over which agent fires when, but zero configuration.

If you want hand-rolled sub-agents anyway, drop the templates from `templates/agents/` into your Cowork project root in an `agents/` folder, and Cowork will pick them up.

## 6. Skills

Cowork has a Skills marketplace organised by role: Marketing, Sales, Finance, Small Business.

1. Browse the marketplace, install bundles matching your work.
2. For custom Skills: tell Claude "save this as a Skill called [name]" once a workflow runs cleanly. The SKILL.md saves into your project.

Look at `templates/skills/post-writer-example/SKILL.md` for the expected structure.

## The discipline (same as Claude Code)

The architecture is the easy part. The compounding discipline:

1. Claude makes a mistake.
2. You stop.
3. You write the rule that prevents it.
4. You save it in the right place (Global Instructions / project CLAUDE.md / memory / re-saved Skill).

Do this every day.
