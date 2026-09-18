# Execução de benchmarks

Automatizações entram aqui somente depois da primeira execução manual reproduzível. Inicialmente, registre cada tentativa usando o template em `benchmarks/results/`.

## Protocolo do rerun

Para comparar execuções, mantenha tarefa, prompt e workspace equivalentes. Use um `model_slug` diferente quando os parâmetros do servidor mudarem, para nunca sobrescrever evidência anterior. Para o Q4 com contexto reduzido:

```bash
scripts/benchmark/prepare-run.sh qwen2.5-coder-14b-instruct-q4-k-m-ctx4k 001-todo-filter
```

Antes de iniciar o agente, capture o estado do servidor:

```bash
scripts/benchmark/capture-llama-state.sh pre \\
  benchmarks/results/qwen2.5-coder-14b-instruct-q4-k-m-ctx4k/001-todo-filter
```

Depois que a sessão terminar (ou for interrompida), capture novamente e exporte a sessão:

```bash
scripts/benchmark/capture-llama-state.sh post \\
  benchmarks/results/qwen2.5-coder-14b-instruct-q4-k-m-ctx4k/001-todo-filter
scripts/benchmark/record-opencode-session.sh \\
  qwen2.5-coder-14b-instruct-q4-k-m-ctx4k 001-todo-filter <session-id>
```

O snapshot preserva as respostas de `/health`, `/slots` e `/metrics` quando disponíveis. No registro final, anote também o comando exato do servidor, status da validação manual, arquivos modificados e qualquer intervenção humana. O throughput do `llama-server` deve ser separado dos tokens por segundo de parede da sessão completa do OpenCode.
