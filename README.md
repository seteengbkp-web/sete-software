# SETE Engenharia · Software (escritório)

Sistema de acompanhamento de execução de serviços da SETE Engenharia. Arquivo único `sistema.html`, com instalador Windows gerado pelo robô do GitHub (`SETE-Setup.exe`).

- Nuvem: Supabase (tabela `sete_registros`, bucket `sete-fotos`). Rode `supabase_sete.sql` no SQL Editor do projeto e cole a URL e a chave publishable no começo do `sistema.html` (`SYNC_PADRAO`).
- Versão fica dentro do HTML (`SYSTEM_VERSION`); `versao-sistema.json` é escrito pelo robô, nunca à mão.
- Primeiro acesso: usuário `sete`, senha `Sete` (troque em Equipes e Funcionários → Usuários).
