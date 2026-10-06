#!/usr/bin/env sh
echo "--- versions (buggy) ---"
npx --yes envinfo --system --binaries --npmPackages
echo
echo "=== eslint with @typescript-eslint 8.71.1 (expect 1 error) ==="
npx eslint
buggy_exit=$?
echo "exit: $buggy_exit"
echo

echo "--- downgrade to 8.71.0 ---"
npm install --no-save --no-audit --no-fund @typescript-eslint/eslint-plugin@8.71.0 >/dev/null
npx --yes envinfo --npmPackages
echo
echo "=== eslint with @typescript-eslint 8.71.0 (expect clean) ==="
npx eslint
fixed_exit=$?
echo "exit: $fixed_exit"
echo

if [ "$buggy_exit" -ne 0 ] && [ "$fixed_exit" -eq 0 ]; then
  echo "BUG CONFIRMED: 8.71.1 false positive, 8.71.0 clean"
  exit 0
fi
echo "NOT REPRODUCED"
exit 1
