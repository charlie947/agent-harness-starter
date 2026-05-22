#!/usr/bin/env bash
# Scaffolds ~/.claude/ directory structure for the agent harness.
# Safe to re-run. Backs up existing CLAUDE.md before any change.

set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p "$CLAUDE_DIR"
mkdir -p "$CLAUDE_DIR/memory"
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/commands"

if [[ -f "$CLAUDE_DIR/CLAUDE.md" ]]; then
  cp "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.backup-$TIMESTAMP"
  echo "Backed up existing CLAUDE.md to CLAUDE.md.backup-$TIMESTAMP"
fi

if [[ ! -f "$CLAUDE_DIR/memory/MEMORY.md" ]]; then
  touch "$CLAUDE_DIR/memory/MEMORY.md"
  echo "Created empty $CLAUDE_DIR/memory/MEMORY.md"
fi

echo "Scaffold complete:"
echo "  $CLAUDE_DIR/CLAUDE.md          (ready to populate)"
echo "  $CLAUDE_DIR/memory/MEMORY.md   (index)"
echo "  $CLAUDE_DIR/skills/            (your workflows go here)"
echo "  $CLAUDE_DIR/agents/            (your sub-agents go here)"
echo "  $CLAUDE_DIR/commands/          (your slash commands go here)"
