# Runtime do baseline

O baseline usa o binário CUDA nativo de Windows do `llama.cpp`, executado a partir do WSL. Essa escolha evita instalar um CUDA Toolkit completo no WSL: o driver já é exposto ao WSL, mas o toolkit e uma build CUDA para Linux não estavam instalados.

| Campo | Valor |
| --- | --- |
| Release semântico | `v0.4.1` |
| Build apontado pelo release | `b10964` |
| Artefato | `llama-b10964-bin-win-cuda-12.4-x64.zip` |
| Origem | `ggml-org/llama.cpp` no GitHub |

Instalar o runtime em `C:\\Users\\Nico\\projects\\local-coding-agent-runtime\\llama.cpp-b10964\\`; essa pasta fica fora do repositório e não é versionada. O executável não deve permanecer no disco Linux do WSL: o Windows o inicia a partir de um caminho UNC e o `llama-server` pode ficar bloqueado. Antes de baixar o modelo, valide `llama-server.exe --version` e depois use o perfil em `qwen2.5-coder-14b-initial.args`.
