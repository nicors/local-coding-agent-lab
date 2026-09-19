# Smoke test — Qwen2.5-Coder-14B Q5_K_M

- Data: 2026-09-19
- Endpoint testado: `http://172.23.112.1:8081`
- Modelo anunciado: `qwen2.5-coder-14b-instruct-q5_k_m`
- Runtime reportado: `b10964-b29c606e2`

## Resultado

| Verificação | Resultado |
| --- | --- |
| `GET /health` | HTTP 200; `{"status":"ok"}` |
| `GET /v1/models` | HTTP 200; modelo esperado anunciado |
| `POST /v1/chat/completions` | HTTP 200; resposta exata `SMOKE_OK` |
| `POST /completion` | HTTP 200; resposta contém `SMOKE_OK` |

## Conclusão

O servidor, o modelo e as duas rotas de geração respondem normalmente. As falhas Q4/Q5 não são explicadas por indisponibilidade básica do `llama-server` ou por incapacidade de gerar texto.

Este teste ainda não valida o cliente OpenCode nem chamadas de ferramenta. O próximo smoke test deve abrir uma cópia descartável da tarefa e exigir uma edição mínima, seguida de `python3 -m unittest discover -s tests -v`.
