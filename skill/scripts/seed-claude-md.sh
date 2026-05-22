#!/usr/bin/env bash
# Drops the templates from this repo into the user's ~/.claude/ folder.
# Run AFTER setup.sh. Run from the repo root.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CLAUDE_DIR="$HOME/.claude"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

if [[ ! -d "$CLAUDE_DIR" ]]; then
  echo "Error: $CLAUDE_DIR does not exist. Run setup.sh first." >&2
  exit 1
fi

backup_if_exists() {
  local path="$1"
  if [[ -f "$path" ]]; then
    cp "$path" "$path.backup-$TIMESTAMP"
    echo "Backed up $path → $path.backup-$TIMESTAMP"
  fi
}

backup_if_exists "$CLAUDE_DIR/CLAUDE.md"
cp "$REPO_DIR/templates/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "Seeded $CLAUDE_DIR/CLAUDE.md"

backup_if_exists "$CLAUDE_DIR/memory/MEMORY.md"
cp "$REPO_DIR/templates/memory/MEMORY.md" "$CLAUDE_DIR/memory/MEMORY.md"
cp "$REPO_DIR/templates/memory/feedback_example.md" "$CLAUDE_DIR/memory/feedback_example.md"
echo "Seeded $CLAUDE_DIR/memory/"

mkdir -p "$CLAUDE_DIR/skills/post-writer-example"
cp "$REPO_DIR/templates/skills/post-writer-example/SKILL.md" "$CLAUDE_DIR/skills/post-writer-example/SKILL.md"
echo "Seeded $CLAUDE_DIR/skills/post-writer-example/"

cp "$REPO_DIR/templates/agents/strategist.md" "$CLAUDE_DIR/agents/strategist.md"
cp "$REPO_DIR/templates/agents/builder.md" "$CLAUDE_DIR/agents/builder.md"
cp "$REPO_DIR/templates/agents/qa-scorer.md" "$CLAUDE_DIR/agents/qa-scorer.md"
echo "Seeded $CLAUDE_DIR/agents/"

echo
echo "Done. Open ~/.claude/CLAUDE.md and replace the [placeholders] with your details."
