# Local Coding Agent Lab

Laboratório para avaliar um LLM local como worker de implementação, integrado ao OpenCode por uma API compatível com OpenAI.

O primeiro marco é um baseline reproduzível, sem kernels, patches ou parâmetros experimentais: `llama.cpp` upstream + `llama-server` + um modelo GGUF + OpenCode.

## Estrutura

- `docs/` — plano, arquitetura e método de benchmark.
- `configs/llama.cpp/` — argumentos versionáveis para o `llama-server`.
- `configs/opencode/` — exemplo de conexão e instruções de integração.
- `benchmarks/tasks/` — tarefas com escopo e critério de sucesso explícitos.
- `benchmarks/baselines/` — definições dos cenários de comparação.
- `benchmarks/results/` — resultados brutos e resumos, ignorando artefatos pesados.
- `scripts/setup/` — verificações locais e preparação manual.
- `scripts/benchmark/` — execução de uma tarefa de benchmark.
- `scripts/profiling/` — coleta leve de ambiente e desempenho.
- `models/` — apenas manifestos e instruções; pesos não entram no Git.
- `experiments/` — registros de hipóteses e decisões.

## Próximo passo

1. Iniciar pelo Qwen2.5-Coder-14B-Instruct conforme `models/candidates.md`.
2. Copiar e ajustar `configs/llama.cpp/qwen2.5-coder-14b-initial.args` para a máquina.
3. Subir o servidor com `llama-server $(tr '\n' ' ' < configs/llama.cpp/qwen2.5-coder-14b-initial.args)`.
4. Configurar o provedor local conforme `configs/opencode/README.md`.
5. Rodar uma tarefa pequena e registrar o resultado em `benchmarks/results/`.

Detalhes operacionais estão em [docs/plan.md](docs/plan.md) e [docs/benchmark-methodology.md](docs/benchmark-methodology.md).
