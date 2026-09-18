# Prompt padronizado — coding agent benchmark

Prompt curto para reduzir o contexto enviado ao modelo local:

```text
Execute a tarefa descrita em `BENCHMARK_TASK.md`. Faça apenas as alterações necessárias; não altere testes nem adicione dependências. Ao terminar, liste os arquivos modificados. Seja direto e não repita o plano.
```

## Regras de uso

- A validação dos testes e o registro dos resultados são feitos manualmente depois da execução.
- O diretório atual deve ser a cópia de trabalho específica do modelo.
- O conteúdo de `BENCHMARK_TASK.md` deve ser idêntico entre as execuções da mesma tarefa.
- O modelo, quantização, runtime, duração, intervenções e resultado devem ser registrados separadamente em `benchmarks/results/<modelo>/`.
