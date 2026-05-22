#!/usr/bin/env bash
# Installs the agent-harness-setup skill + slash command into the user's ~/.claude/.
# Safe to re-run. Backs up existing files before overwriting.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p "$CLAUDE_DIR/skills/agent-harness-setup/scripts"
mkdir -p "$CLAUDE_DIR/commands"

backup_if_exists() {
  local path="$1"
  if [[ -e "$path" ]]; then
    mv "$path" "$path.backup-$TIMESTAMP"
    echo "Backed up $path → $path.backup-$TIMESTAMP"
  fi
}

# Skill
backup_if_exists "$CLAUDE_DIR/skills/agent-harness-setup/SKILL.md"
cp "$REPO_DIR/skill/SKILL.md" "$CLAUDE_DIR/skills/agent-harness-setup/SKILL.md"

cp "$REPO_DIR/skill/scripts/setup.sh" "$CLAUDE_DIR/skills/agent-harness-setup/scripts/setup.sh"
cp "$REPO_DIR/skill/scripts/seed-claude-md.sh" "$CLAUDE_DIR/skills/agent-harness-setup/scripts/seed-claude-md.sh"
chmod +x "$CLAUDE_DIR/skills/agent-harness-setup/scripts/"*.sh

# Slash command
backup_if_exists "$CLAUDE_DIR/commands/agent-harness-setup.md"
cp "$REPO_DIR/commands/agent-harness-setup.md" "$CLAUDE_DIR/commands/agent-harness-setup.md"

echo
echo "Installed:"
echo "  Skill         → $CLAUDE_DIR/skills/agent-harness-setup/SKILL.md"
echo "  Slash command → $CLAUDE_DIR/commands/agent-harness-setup.md"
echo
echo "Restart Claude Code, then type /agent-harness-setup in any session."
