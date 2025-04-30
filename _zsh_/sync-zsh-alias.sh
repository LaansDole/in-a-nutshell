#!/usr/bin/env bash
set -euo pipefail

ZSHRC="$HOME/.zshrc"
ALIAS_FILE="$HOME/.zsh-alias.sh"

# --- no spaces around '=' here! ---
BEGIN_MARK="# >>> BEGIN MY ALIASES >>>"
END_MARK="# <<< END   MY ALIASES <<<"

# 1) make sure your alias file exists
if [[ ! -f "$ALIAS_FILE" ]]; then
  echo "❌  Alias file $ALIAS_FILE not found. Create it first." >&2
  exit 1
fi

# 2) delete any old injected block between the markers
if grep -Fxq "$BEGIN_MARK" "$ZSHRC"; then
  sed -i.bak "/^$(printf '%s' "$BEGIN_MARK")\$/,/^$(printf '%s' "$END_MARK")\$/d" "$ZSHRC"
fi

# 3) wipe out all remaining 'alias …' lines in ~/.zshrc
sed -i "/^alias[[:space:]]/d" "$ZSHRC"

# 4) append the fresh block wrapped in markers
{
  echo ""
  echo "$BEGIN_MARK"
  cat "$ALIAS_FILE"
  echo "$END_MARK"
} >> "$ZSHRC"

echo "✅  Synced aliases from $ALIAS_FILE into $ZSHRC."
source $HOME/.zshrc