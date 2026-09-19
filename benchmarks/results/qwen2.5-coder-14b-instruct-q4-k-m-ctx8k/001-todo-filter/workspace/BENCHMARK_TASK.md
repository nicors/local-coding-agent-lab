# Task 001 — filtro de tarefas

## Contexto

Este é um microbenchmark de implementação. O projeto de trabalho é uma pequena biblioteca Python, sem dependências externas.

## Solicitação

Implemente `filter_todos` em `todo.py`.

A função deve:

1. retornar uma nova lista, sem modificar a entrada;
2. filtrar por `status` quando esse argumento não for `None`;
3. filtrar por `tag` quando esse argumento não for `None`;
4. aplicar os dois filtros quando ambos forem informados;
5. manter a ordem original dos itens;
6. retornar todos os itens quando os dois filtros forem `None`.

Não altere os testes existentes. Não adicione dependências.

## Validação

Execute na raiz da cópia de trabalho:

```bash
python3 -m unittest discover -s tests -v
```

## Definição de pronto

- a implementação está completa;
- todos os testes passam;
- a entrada permanece inalterada;
- o agente relata o comando de validação e os arquivos modificados.
