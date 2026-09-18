# Prompt padronizado — coding agent benchmark

Use este texto, sem alterações, em cada modelo e em cada repetição da mesma tarefa:

```text
Você está executando uma tarefa de benchmark de coding agent.

1. Leia o arquivo BENCHMARK_TASK.md no diretório atual.
2. Inspecione apenas os arquivos necessários para entender a tarefa.
3. Implemente a solicitação exatamente como descrita.
4. Não altere testes existentes nem adicione dependências, salvo instrução explícita da tarefa.
5. Execute o comando de validação indicado em BENCHMARK_TASK.md.
6. Se a validação falhar, corrija a implementação e execute-a novamente.
7. Ao terminar, informe de forma concisa: arquivos modificados, comando executado, resultado dos testes e qualquer limitação.

Não repita o resumo do objetivo sem avançar. Se o contexto for compactado, continue a partir dos arquivos e do estado atual do workspace.
Não peça confirmação para as ações normais desta tarefa; pare somente se encontrar um bloqueio real.
```

## Regras de uso

- O diretório atual deve ser a cópia de trabalho específica do modelo.
- O conteúdo de `BENCHMARK_TASK.md` deve ser idêntico entre as execuções da mesma tarefa.
- O modelo, quantização, runtime, duração, intervenções e resultado devem ser registrados separadamente em `benchmarks/results/<modelo>/`.
