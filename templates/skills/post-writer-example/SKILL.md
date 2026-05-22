---
name: post-writer-example
description: Example Skill that drafts a LinkedIn post from a topic or rough idea, using the user's voice files and brand rules. Use when the user says "write a LinkedIn post about X", "draft a post on Y", or "turn this into a LinkedIn post". This is a starter template — replace placeholders with your own voice files and rules.
---

# Post Writer (example)

Drafts a LinkedIn post in the user's voice from a topic or rough idea.

This is a starter template. Replace every `[placeholder]` with your own files and rules, then save and fire it from any chat.

## Step 1 — Gather inputs

Ask the user:

1. "What's the topic?"
2. "Any specific angle or hook in mind, or should I propose one?"
3. "Standard length, or short/long?"

## Step 2 — Pull voice references

Read:

- `[path/to/your/voice-file.md]`
- `[path/to/past-best-posts.md]`
- `[path/to/banned-words.md]`

If you have a brand kit, also read `[path/to/brand-kit.md]`.

## Step 3 — Draft

Write the post following these rules:

- [Your sentence length rule]
- [Your hook rule]
- [Your CTA rule]
- [Your formatting conventions — line breaks, bullets, emojis]

## Step 4 — Self-critique

Score the draft 0-100 against:

- Hook strength (30 pts)
- Voice match (30 pts)
- Mechanism specificity (20 pts)
- CTA fit (20 pts)

If under 90, rewrite and re-score. Never show below 90.

## Step 5 — Deliver

Show the user the post. Ask:

> Want me to: (a) publish to Notion drafts, (b) save to file, or (c) iterate?

## Non-negotiables

- Never invent stats. Verify every number against a source.
- Never use the banned words list.
- British/US English consistent with the user's global rule.
