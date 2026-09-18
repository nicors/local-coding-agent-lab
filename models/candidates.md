# Candidatos de modelo

## Ordem de avaliação

| Ordem | Modelo | Papel | Situação |
| --- | --- | --- |
| 1 | Qwen2.5-Coder-14B-Instruct | Baseline prático de coding | Servidor e API validados |
| 2 | gpt-oss-20b | Comparação de raciocínio e tool use | Requer mais RAM no WSL |
| 3 | Qwen3-Coder-30B-A3B-Instruct | Teto MoE para coding agent | Requer mais RAM no WSL |

## Primeiro candidato

Use uma conversão GGUF mantida e com checksum publicado para **Qwen2.5-Coder-14B-Instruct**, preferencialmente em `Q4_K_M` para a primeira tentativa. A prioridade é compatibilidade e repetibilidade, não obter a maior quantização possível.

Antes de baixar, registrar no resultado: repositório de origem, revisão, arquivo exato, tamanho, checksum e licença. Pesos permanecem fora do Git.
