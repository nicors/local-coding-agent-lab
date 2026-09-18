#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
    echo "uso: $0 <modelo> <task-id> <session-id>" >&2
    exit 2
fi

model_slug="$1"
task_id="$2"
session_id="$3"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
run_dir="$repo_root/benchmarks/results/$model_slug/$task_id"

if [[ ! -d "$run_dir" ]]; then
    echo "execução não encontrada: $run_dir" >&2
    exit 1
fi
command -v jq >/dev/null || { echo "jq é necessário" >&2; exit 1; }
opencode_bin="${OPENCODE_BIN:-$(command -v opencode || true)}"
if [[ -z "$opencode_bin" && -x "$HOME/.opencode/bin/opencode" ]]; then
    opencode_bin="$HOME/.opencode/bin/opencode"
fi
[[ -n "$opencode_bin" && -x "$opencode_bin" ]] || { echo "opencode não está disponível; abra um shell novo ou defina OPENCODE_BIN" >&2; exit 1; }

temp_output="$(mktemp)"
temp_json="$(mktemp)"
trap 'rm -f "$temp_output" "$temp_json"' EXIT
"$opencode_bin" export "$session_id" --sanitize > "$temp_output"
sed -n '/^{/,$p' "$temp_output" > "$temp_json"
jq empty "$temp_json"

stamp="$(date -u +%Y-%m-%dT%H%M%SZ)"
run_file="$run_dir/run-$stamp.md"
cp "$temp_json" "$run_dir/session-export-$stamp.json"

created_ms="$(jq -r '.info.time.created // 0' "$temp_json")"
updated_ms="$(jq -r '.info.time.updated // 0' "$temp_json")"
duration_ms=$((updated_ms - created_ms))
duration_s="$(awk -v ms="$duration_ms" 'BEGIN { printf "%.3f", ms / 1000 }')"
input_tokens="$(jq -r '.info.tokens.input // 0' "$temp_json")"
output_tokens="$(jq -r '.info.tokens.output // 0' "$temp_json")"
reasoning_tokens="$(jq -r '.info.tokens.reasoning // 0' "$temp_json")"
tool_calls="$(jq '[.messages[].parts[]? | select(.type == "tool" or .type == "tool-invocation" or .type == "tool-call")] | length' "$temp_json")"
wall_tps="$(awk -v out="$output_tokens" -v sec="$duration_s" 'BEGIN { if (sec > 0) printf "%.3f", out / sec; else print "n/a" }')"

{
    echo "# Execução — $model_slug / $task_id"
    echo
    echo "- Session ID: $session_id"
    echo "- Modelo: $(jq -r '.info.model.providerID + "/" + .info.model.id' "$temp_json")"
    echo "- OpenCode: $(jq -r '.info.version // "desconhecido"' "$temp_json")"
    echo "- Início (epoch ms): $created_ms"
    echo "- Fim (epoch ms): $updated_ms"
    echo "- Duração total: ${duration_s}s"
    echo "- Tokens de entrada: $input_tokens"
    echo "- Tokens de saída: $output_tokens"
    echo "- Tokens de reasoning reportados: $reasoning_tokens"
    echo "- Chamadas de ferramenta: $tool_calls"
    echo "- Saída por segundo de parede: ${wall_tps} tokens/s"
    echo "- Status: preencher após validar os testes"
    echo "- Comando de validação: preencher"
    echo "- Intervenção humana: preencher"
    echo "- Observações: o export do OpenCode não inclui os timings internos de prompt/geração do llama-server."
} > "$run_file"

echo "Registro criado: $run_file"
echo "Export sanitizado: $run_dir/session-export-$stamp.json"
