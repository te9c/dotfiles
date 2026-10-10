#!/bin/bash
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)" || exit 1
exec python3 "$script_dir/install.py" "$@"
