# Resultados por modelo

Cada modelo tem uma pasta própria. Uma execução deve ser preparada com:

```bash
scripts/benchmark/prepare-run.sh <modelo> 001-todo-filter
```

O agente trabalha somente em `benchmarks/results/<modelo>/001-todo-filter/workspace/`. Depois, registre em `run-YYYY-MM-DD.md` o modelo exato, quantização, runtime, parâmetros, duração, intervenção, saída dos testes e o diff.

O diretório `workspace/` é intencionalmente versionado: ele preserva a alteração produzida pelo modelo para comparação posterior. Use `RUN_TEMPLATE.md` para registrar a execução concluída.

Quando uma sessão do OpenCode terminar, colete automaticamente duração, tokens e chamadas de ferramenta com:

```bash
scripts/benchmark/record-opencode-session.sh <modelo> <task-id> <session-id>
```

O `session-id` aparece em `/sessions` ou no histórico exportado do OpenCode. Os timings internos de prompt e geração do `llama-server` continuam sendo uma métrica separada da API direta; não devem ser confundidos com tokens por segundo de parede da sessão completa.
