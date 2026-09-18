#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "uso: $0 <modelo> <task-id>" >&2
    exit 2
fi

model_slug="$1"
task_id="$2"

if [[ ! "$model_slug" =~ ^[a-z0-9][a-z0-9.-]*$ || ! "$task_id" =~ ^[0-9][a-z0-9-]*$ ]]; then
    echo "modelo ou task-id contém caracteres inválidos" >&2
    exit 2
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
fixture_dir="$repo_root/benchmarks/tasks/$task_id/fixture"
task_file="$repo_root/benchmarks/tasks/$task_id/task.md"
run_dir="$repo_root/benchmarks/results/$model_slug/$task_id"
workspace_dir="$run_dir/workspace"

if [[ ! -d "$fixture_dir" || ! -f "$task_file" ]]; then
    echo "tarefa não encontrada: $task_id" >&2
    exit 1
fi
if [[ -e "$workspace_dir" ]]; then
    echo "execução já preparada: $workspace_dir" >&2
    echo "remova ou renomeie a execução manualmente para evitar sobrescrever evidências" >&2
    exit 1
fi

mkdir -p "$run_dir"
cp -a "$fixture_dir" "$workspace_dir"
cp "$task_file" "$run_dir/BENCHMARK_TASK.md"
printf '%s\n' \
    "model_slug: $model_slug" \
    "task_id: $task_id" \
    "prepared_at_utc: $(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    "workspace: $workspace_dir" \
    > "$run_dir/RUN_METADATA.md"

echo "Cópia preparada em: $workspace_dir"
echo "Instruções: $run_dir/BENCHMARK_TASK.md"
