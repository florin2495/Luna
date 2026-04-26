#!/usr/bin/env bash
#
# Clone Luna's sibling repositories next to this one.
#
# Usage:
#   ./scripts/clone-all.sh
#
# Override the GitHub user with an env var if you forked the repos:
#   GH_USER=someone-else ./scripts/clone-all.sh
#
set -euo pipefail

GH_USER="${GH_USER:-florin2495}"

# Resolve the directory containing this script, then move up two levels to
# Luna's parent — that's where the sibling repos should live side-by-side.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"

cd "${PARENT_DIR}"
echo "Cloning siblings into: ${PARENT_DIR}"
echo

siblings=(
  "baby-monitor-backend"
  "baby-monitor-frontend"
)

for repo in "${siblings[@]}"; do
  if [ -d "${repo}/.git" ]; then
    printf '  [skip]  %-25s already cloned\n' "${repo}"
  else
    printf '  [clone] %-25s ' "${repo}"
    git clone --quiet "https://github.com/${GH_USER}/${repo}.git"
    echo "ok"
  fi
done

echo
echo "Done. Layout:"
ls -1d Luna baby-monitor-backend baby-monitor-frontend 2>/dev/null \
    | sed 's/^/  /'
