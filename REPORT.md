# Relatório de Decisões Técnicas — Protótipo Gestão Fazenda

Data: 2025

## Objetivo
Criar um protótipo funcional e acessível para gerenciar atividades e estoque de uma fazenda, aplicando conceitos de frameworks, semântica HTML e estilização responsiva.

## Decisões principais
- **Framework:** React foi escolhido por sua popularidade e facilidade de organizar interfaces dinâmicas. Para protótipo rápido optou-se por UMD builds via CDN para evitar configuração de ferramentas (Vite/CRA).
- **Estilização:** Tailwind CSS via CDN para acelerar o desenvolvimento e garantir responsividade com classes utilitárias.
- **Persistência:** LocalStorage foi adotado para manter dados entre recarregamentos sem backend.
- **Acessibilidade e Semântica:** O HTML segue estrutura semântica (header, main). Componentes usam elementos nativos de formulário e botões com labels implícitos para facilitar navegação com teclado.
- **Adaptabilidade:** Projeto pensado para operação em ambientes rurais com internet limitada — usa armazenamento local e não depende inicialmente de API externa. Futuras versões podem implementar sincronização offline/online.
- **Segurança e LGPD:** Como protótipo, não há armazenamento sensível. Em produção, recomenda-se autenticação, criptografia em trânsito (HTTPS) e políticas de privacidade conforme LGPD.

## Como publicar no GitHub
1. Criar repositório (ex.: `gestao-fazenda-prototipo`).
2. Subir os arquivos (`index.html`, `README.md`, `REPORT.md`).
3. Ativar GitHub Pages (Settings → Pages → Source: `main` branch / root).
4. Acessar `https://<usuario>.github.io/<repo>/index.html`

## Próximos passos recomendados
- Migrar para um projeto com bundler (Vite) e React + Tailwind via npm.
- Implementar backend simples (Node.js/Express + PostgreSQL) ou Firebase.
- Adicionar autenticação de usuários e controle de permissões.
- Implementar log de ações e exportação de relatórios.

