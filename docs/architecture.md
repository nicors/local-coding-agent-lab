# Arquitetura do baseline

## Componentes

| Componente | Responsabilidade |
| --- | --- |
| OpenCode | Orquestra a tarefa, o contexto do repositório e as ferramentas. |
| `llama-server` | Expõe o modelo por endpoint compatível com OpenAI. |
| `llama.cpp` | Executa inferência local com a versão upstream escolhida. |
| GGUF | Artefato de modelo versionado fora do repositório. |
| Harness de benchmark | Padroniza tarefas, execução e evidências. |

## Limites

Configurações que variam por máquina ficam em cópias locais dos arquivos de exemplo ou em variáveis de ambiente. Pesos, chaves e resultados brutos não devem ser versionados.

## Reprodutibilidade mínima

Cada resultado precisa associar a tarefa a: commit do projeto avaliado, versão do `llama.cpp`, modelo/quantização, parâmetros do servidor, hardware, comando executado e status dos testes.
