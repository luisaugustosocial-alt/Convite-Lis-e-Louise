# Convite Liz & Louise 🍒

Site responsivo com animação de regar cerejas, visual Liquid Glass, sugestões de presentes, confirmação online e painel administrativo usando Firebase.

## Arquivos
- `index.html`: convite público e formulário de confirmação.
- `admin.html`: painel de administração, edição dos detalhes, URL da foto e lista de confirmações.
- `firebase-config.example.js`: modelo da configuração do app Web.
- `firestore.rules`: regras de segurança para detalhes do evento e confirmações.
- Fotos: hospedadas no ImageKit; o painel guarda somente o URL público no Firestore.

## Configuração
1. Crie o projeto Firebase e adicione um app Web.
2. Crie `firebase-config.js` na raiz do repositório copiando `firebase-config.example.js` e preenchendo os dados do app Web.
3. Ative Authentication → Sign-in method → Email/Password.
4. Em Authentication → Users, crie a conta administrativa.
5. Crie o Cloud Firestore.
6. Em Firestore Database → Rules, publique o conteúdo de `firestore.rules`. O e-mail de administração já está configurado para `augstose@gmail.com`; altere-o se necessário.
7. Faça upload da foto no ImageKit e copie o URL público HTTPS.
8. Acesse `/admin.html`, entre com a conta administrativa, preencha os detalhes e cole o link da foto do ImageKit. Salve.
9. A Vercel deverá publicar as mudanças após o commit no GitHub, se o repositório estiver conectado.

## Segurança
- `firebase-config.js` contém a configuração pública do app web. Nunca publique chaves de conta de serviço ou credenciais privadas.
- As regras do Firestore restringem a leitura das confirmações e as alterações dos detalhes à conta administrativa configurada.
- Convidados podem enviar nomes e acompanhantes; só a administradora pode ler a lista.
- As confirmações só serão persistidas quando o Firebase estiver configurado e as regras forem publicadas.
