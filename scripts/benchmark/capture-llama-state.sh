#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 || $# -gt 3 ]]; then
    echo "uso: $0 <pre|post> <diretório-da-execução> [base-url]" >&2
    exit 2
fi

phase="$1"
output_dir="$2"
base_url="${3:-${LLAMA_BASE_URL:-http://172.23.112.1:8081}}"

case "$phase" in
    pre|post) ;;
    *) echo "fase inválida: use pre ou post" >&2; exit 2 ;;
esac

command -v curl >/dev/null || { echo "curl é necessário" >&2; exit 1; }
mkdir -p "$output_dir/server-state"
stamp="$(date -u +%Y-%m-%dT%H%M%SZ)"
prefix="$output_dir/server-state/${phase}-${stamp}"

printf 'captured_at_utc: %s\nbase_url: %s\nphase: %s\n' \
    "$stamp" "$base_url" "$phase" > "${prefix}.metadata.txt"

for endpoint in health slots metrics; do
    url="$base_url/$endpoint"
    if curl --silent --show-error --fail --max-time 15 "$url" > "${prefix}-${endpoint}.txt"; then
        printf 'endpoint: %s\nstatus: ok\n' "$url" >> "${prefix}.metadata.txt"
    else
        status=$?
        printf 'endpoint: %s\nstatus: unavailable (curl exit %s)\n' "$url" "$status" >> "${prefix}.metadata.txt"
        printf 'unavailable: %s (curl exit %s)\n' "$url" "$status" > "${prefix}-${endpoint}.txt"
    fi
done

echo "Snapshot salvo em: ${prefix}-*.txt"
