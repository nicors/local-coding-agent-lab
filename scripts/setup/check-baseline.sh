#!/usr/bin/env bash
set -euo pipefail

command -v llama-server >/dev/null && echo "llama-server: encontrado" || echo "llama-server: não encontrado no PATH"
command -v opencode >/dev/null && echo "OpenCode: encontrado" || echo "OpenCode: não encontrado no PATH"
test -f configs/llama.cpp/baseline.args && echo "Configuração baseline: encontrada"
