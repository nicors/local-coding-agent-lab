# Integração com OpenCode

Configure no OpenCode um provedor compatível com OpenAI apontando para o servidor local, normalmente `http://127.0.0.1:8080/v1`. O nome do modelo deve coincidir com o anunciado pelo servidor.

Antes de um benchmark, confirme:

- o endpoint responde a uma chamada simples;
- o OpenCode enxerga o provedor e o modelo;
- o projeto de teste abre normalmente;
- permissões de leitura, edição e comandos estão no escopo desejado.

Evite tratar este arquivo como configuração pronta: os campos exatos dependem da versão instalada do OpenCode. Quando a integração estiver validada, registre aqui um exemplo sanitizado e a versão usada.
