#!/usr/bin/env bash
set -eo pipefail
# Removed the 'u' flag to prevent errors on unset variables

# Ensure HOME is set
: "${HOME:?HOME environment variable not set}"

ZSHRC="$HOME/.zshrc"
ALIAS_FILE="$HOME/.zsh-alias.sh"

BEGIN_MARK="# >>> BEGIN MY ALIASES >>>"
END_MARK_TEXT="# <<< END   MY ALIASES <<<"

# 1) ensure alias file exists
if [[ ! -f "$ALIAS_FILE" ]]; then
  echo "Error: Alias file $ALIAS_FILE not found. Create it first." >&2
  exit 1
fi

# 2) ensure zshrc exists
if [[ ! -f "$ZSHRC" ]]; then
  echo "Creating $ZSHRC file..."
  touch "$ZSHRC" || { echo "Error: Could not create $ZSHRC"; exit 1; }
fi

# 3) remove any old injected block
if grep -Fxq "$BEGIN_MARK" "$ZSHRC" 2>/dev/null; then
  sed -i.bak "/^$BEGIN_MARK$/,/^$END_MARK_TEXT$/d" "$ZSHRC"
fi

# 4) wipe out all remaining 'alias ' lines
sed -i.bak2 "/^alias[[:space:]]/d" "$ZSHRC"

# 5) insert exactly one blank line before the new block if needed
if [[ -s "$ZSHRC" ]]; then
  last_line="$(tail -n1 "$ZSHRC" 2>/dev/null || echo "")"
  if [[ -n "$last_line" ]]; then
    printf "\n" >> "$ZSHRC"
  fi
fi

# 6) append the fresh block
{
  echo "$BEGIN_MARK"
  cat "$ALIAS_FILE"
  echo "$END_MARK_TEXT"
} >> "$ZSHRC"

echo "Synced aliases from $ALIAS_FILE into $ZSHRC."
echo "Run 'source ~/.zshrc' to apply changes."
