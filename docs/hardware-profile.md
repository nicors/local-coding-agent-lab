# Perfil de hardware — baseline local

_Verificado em 18 de setembro de 2026._

| Componente | Valor observado |
| --- | --- |
| Sistema de inferência | WSL2 sobre Windows |
| GPU | NVIDIA GeForce RTX 5060 Ti |
| VRAM disponível | 8.0 GiB |
| Driver NVIDIA | 616.64 |
| RAM visível para o WSL | 15 GiB |
| Swap do WSL | 4 GiB |

## Implicação para o baseline

O primeiro modelo deve caber na RAM do WSL sem depender de swap. Por isso, o primeiro teste usa Qwen2.5-Coder-14B-Instruct em GGUF Q4, com contexto de 8k e offload parcial para GPU.

Modelos de 20B–30B permanecem candidatos, mas só entram após aumentar o limite de memória do WSL e concluir este baseline. A VRAM de 8 GiB torna esperado o uso híbrido CPU+GPU; desempenho, não apenas correção, será medido.
