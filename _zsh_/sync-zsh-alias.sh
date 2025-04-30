#!/usr/bin/env bash
set -euo pipefail

ZSHRC="$HOME/.zshrc"
ALIAS_FILE="$HOME/.zsh-alias.sh"

BEGIN_MARK="# >>> BEGIN MY ALIASES >>>"
END_MARK="# <<< END   MY ALIASES <<<"

# 1) ensure alias file exists
if [[ ! -f "$ALIAS_FILE" ]]; then
  echo "Error: Alias file $ALIAS_FILE not found. Create it first." >&2
  exit 1
fi

# 2) remove any old injected block
if grep -Fxq "$BEGIN_MARK" "$ZSHRC"; then
  sed -i.bak "/^$(printf '%s' "$BEGIN_MARK")\$/,/^$(printf '%s' "$END_MARK")\$/d" "$ZSHRC"
fi

# 3) wipe out all remaining 'alias ' lines
sed -i "/^alias[[:space:]]/d" "$ZSHRC"

# 4) insert exactly one blank line before the new block if needed
last_line="$(tail -n1 "$ZSHRC")"
if [[ -n $last_line ]]; then
  printf "\n" >> "$ZSHRC"
fi

# 5) append the fresh block without an extra leading newline
{
  echo "$BEGIN_MARK"
  cat "$ALIAS_FILE"
  echo "$END_MARK"
} >> "$ZSHRC"

echo "Synced aliases from $ALIAS_FILE into $ZSHRC."
