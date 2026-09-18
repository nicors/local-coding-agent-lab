# Prompt padronizado — coding agent benchmark

Prompt curto para reduzir o contexto enviado ao modelo local:

```text
Leia `BENCHMARK_TASK.md`, implemente a tarefa, não altere os testes, rode a validação indicada e corrija falhas se necessário. No final, liste arquivos modificados e resultado dos testes. Seja direto e não repita o plano.
```

## Regras de uso

- O diretório atual deve ser a cópia de trabalho específica do modelo.
- O conteúdo de `BENCHMARK_TASK.md` deve ser idêntico entre as execuções da mesma tarefa.
- O modelo, quantização, runtime, duração, intervenções e resultado devem ser registrados separadamente em `benchmarks/results/<modelo>/`.
