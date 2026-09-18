# Metodologia de benchmark

## Princípios

- Poucas tarefas, bem especificadas e repetíveis.
- Mesmo repositório, estado inicial e critérios de sucesso para todos os candidatos.
- Registrar falhas e intervenção humana, não apenas sucessos.
- Separar latência de geração, tempo total e qualidade da alteração.

## Formato de uma tarefa

Cada diretório em `benchmarks/tasks/` contém `task.md` com contexto, instruções, limites, comando de validação e definição de pronto.

## Métricas iniciais

| Métrica | Como registrar |
| --- | --- |
| Conclusão | passou, falhou ou requer intervenção. |
| Correção | resultado do comando de validação. |
| Tempo total | início ao término da tentativa. |
| Uso de ferramentas | comandos/edições relevantes. |
| Intervenção | nenhuma, leve ou substancial. |

Use `benchmarks/results/TEMPLATE.md` para cada execução.
