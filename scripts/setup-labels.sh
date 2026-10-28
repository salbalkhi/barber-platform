#!/usr/bin/env bash
# Creates (or updates) the RE labels from .github/labels.json in a GitHub repository.
# Labels are NOT copied by "Use this template", so run this once per new repository.
# Requirements: GitHub CLI (gh) authenticated, and jq.
# Usage: scripts/setup-labels.sh owner/repo
set -euo pipefail

REPO="${1:?Usage: $0 owner/repo}"
LABELS_FILE="$(dirname "$0")/../.github/labels.json"

jq -c '.[]' "$LABELS_FILE" | while read -r label; do
  name=$(echo "$label" | jq -r '.name')
  color=$(echo "$label" | jq -r '.color')
  desc=$(echo "$label" | jq -r '.description')
  gh label create "$name" --repo "$REPO" --color "$color" --description "$desc" --force
done

echo "Labels synced to $REPO"
