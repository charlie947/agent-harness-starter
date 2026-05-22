# Agent Harness Starter

A scaffold for setting up your own agent harness in Claude Code or Cowork. Companion to the [MarTech AI newsletter issue on agent harnesses](https://charliehills.substack.com) by [Charlie Hills](https://www.linkedin.com/in/charlie-hills/).

The "agent harness" term was coined by Mitchell Hashimoto in February 2026. It describes the layer wrapped around an LLM that turns it from a chatbot into a worker that ships jobs end to end.

This repo gives you the folder structure, the templates, and an interactive setup skill so you can build your own harness in one session.

## What you get

Six components, all markdown:

1. **Personalisation** — global rules that follow you across every project (`~/.claude/CLAUDE.md`).
2. **Context** — project-specific rules (`your-project/CLAUDE.md`).
3. **Action** — read-write access to your real apps (MCP connectors).
4. **Memory** — corrections that load every session (`~/.claude/memory/`).
5. **Delegation** — specialist sub-agents (`~/.claude/agents/`).
6. **Skills** — saved workflows you fire by name (`~/.claude/skills/`).

Plugins and Hooks intentionally left out of v1. Both add complexity without much install-time value. You can layer them on later.

## Install

### Claude Code users

```bash
git clone https://github.com/charlie947/agent-harness-starter ~/agent-harness-starter
cp -r ~/agent-harness-starter/skill ~/.claude/skills/agent-harness-setup
```

Then in any Claude Code session:

```
/agent-harness-setup
```

The skill walks you through the global setup (Personalisation, Memory, Skills, Agents) and offers to scaffold a project setup too.

### Cowork users

A `SKILL.md` is a Claude Code construct, but the underlying templates work identically in Cowork because they're plain markdown. See [`cowork-setup.md`](./cowork-setup.md) for the manual walkthrough.

## Repo structure

```
agent-harness-starter/
├── README.md                  This file
├── cowork-setup.md            Cowork install path
├── LICENSE                    MIT
├── skill/                     The interactive setup skill
│   ├── SKILL.md
│   └── scripts/
│       ├── setup.sh           Creates ~/.claude/ folder structure
│       └── seed-claude-md.sh  Drops templates into ~/.claude/
├── templates/                 Generic skeleton files with placeholders
│   ├── CLAUDE.md              Global personalisation template
│   ├── project-CLAUDE.md      Project-level context template
│   ├── memory/
│   │   ├── MEMORY.md          Index template
│   │   └── feedback_example.md
│   ├── skills/
│   │   └── post-writer-example/
│   │       └── SKILL.md
│   └── agents/
│       ├── strategist.md
│       ├── builder.md
│       └── qa-scorer.md
└── examples/charlie/          Charlie's real (sanitised) stack — coming soon
```

## The discipline

The architecture is the easy part. The discipline that compounds:

1. The agent does something wrong.
2. You stop.
3. You write the rule that prevents it.
4. You save the rule in the right place.

Where to save depends on scope:

- Global preference (banned words, voice) → Personalisation
- Project rule (this audience, this voice) → Context
- One-off fix (a name, a specific fact) → Memory
- Workflow change (steps in wrong order) → Re-save the Skill

Do this every day. The folder of rules isn't the achievement. The discipline of routing every mistake into its right home is.

## Three practices from OpenAI's harness team

1. **Treat CLAUDE.md like a table of contents.** Don't dump everything in. Point to deeper files when detail is needed. A bloated CLAUDE.md slows every chat.
2. **Define principles, not micromanagement.** Manage like a senior contractor, not an intern.
3. **Garden your docs.** Rules go stale. Build a maintenance agent whose only job is to refresh docs and flag drift.

## Ways we can work together

- **Subscribe to MarTech AI** — the weekly newsletter that walks through this in depth: [charliehills.substack.com](https://charliehills.substack.com)
- **Join the waitlist** for what's next: [charliehills.io/join-the-waitlist](https://charliehills.io/join-the-waitlist)

## License

MIT. Use it, fork it, ship it.
