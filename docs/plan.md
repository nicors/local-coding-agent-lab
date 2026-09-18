# Plano de ação

## Objetivo

Construir um worker local de implementação que receba tarefas bem especificadas, trabalhe em repositórios reais por meio do OpenCode, use ferramentas e execute testes. Modelos cloud permanecem responsáveis por arquitetura, investigação e revisão de maior complexidade.

## Fase inicial: baseline limpo

Pipeline inicial:

```text
OpenCode → API compatível com OpenAI → llama-server → llama.cpp upstream → modelo GGUF
```

Antes de otimizar, validar:

- resposta estável do `llama-server`;
- conexão do OpenCode;
- leitura e edição de arquivos;
- execução de comandos e testes;
- conclusão de tarefas pequenas em um repositório real.

## Escopo desta etapa

Inclui infraestrutura mínima, documentação, tarefas de benchmark e um formato de resultado. Não inclui patches, quantizações experimentais, tuning de prompt, automações de download nem alterações no `llama.cpp`.

## Critério de saída

Um modelo candidato conclui pelo menos uma tarefa pequena, com comandos, versão do modelo, configuração, duração e resultado registrados em `benchmarks/results/`.
