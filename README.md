# Convite Liz & Louise 🍒

Site responsivo com animação de regar cerejas, cartões Liquid Glass, sugestões de presentes, RSVP online e painel administrativo.

## Arquivos
- `index.html`: convite público.
- `admin.html`: painel administrativo com login, edição dos detalhes, upload de foto e lista de confirmações.
- `config.example.js`: modelo de configuração do Supabase.
- `supabase-setup.sql`: tabelas e políticas de acesso.

## Para habilitar o painel e o RSVP real
1. Crie um projeto em https://supabase.com/.
2. Em **Project Settings → API**, copie a Project URL e a chave pública anon/publishable.
3. Crie `config.js` na raiz copiando `config.example.js` e preenchendo esses dois valores. A chave pública pode ficar no frontend; nunca coloque a chave `service_role`.
4. No Supabase, abra **SQL Editor**, cole e execute `supabase-setup.sql`.
5. Em **Authentication → Users**, crie o usuário administrador com e-mail e senha. Desative o cadastro público se não quiser permitir novos usuários.
6. Envie `index.html`, `admin.html`, `config.js` e os demais arquivos para a raiz do repositório GitHub. A Vercel redeploya automaticamente.
7. Acesse `/admin.html` no domínio publicado e entre com o usuário que criou.

## Segurança e limitações
As políticas SQL deste modelo consideram qualquer usuário autenticado como administrador. Mantenha o cadastro público desativado e crie apenas a conta da organizadora. Se houver outros usuários no projeto Supabase, implemente uma allowlist de administradores antes de liberar acesso.
O formulário guarda os nomes enviados no banco de dados. Avise os convidados que os dados serão usados para organizar a festa e não colete informações desnecessárias.
