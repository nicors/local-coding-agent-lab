# llama-server

`baseline.args` é um ponto de partida deliberadamente conservador. Ajuste contexto, camadas na GPU e paralelismo somente depois de registrar uma execução de referência.

Exemplo de inicialização:

```bash
llama-server $(tr '\n' ' ' < configs/llama.cpp/baseline.args)
```

Registre a versão exata de `llama-server` e todos os argumentos efetivamente usados no resultado do benchmark.
