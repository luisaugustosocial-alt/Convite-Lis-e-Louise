# Convite Liz & Louise 🍒

Site responsivo com animação de regar cerejas, visual Liquid Glass, sugestões de presentes, confirmação online e painel administrativo usando **Firebase**.

## Arquivos
- `index.html`: convite público; a animação de regar revela os detalhes da festa.
- `admin.html`: painel com login, edição dos dados, upload da foto e lista de confirmações.
- `firebase-config.example.js`: modelo da configuração do app Web.
- `firestore.rules`: regras para detalhes do evento e confirmações.
- `storage.rules`: regras de acesso às fotos.

## Configuração Firebase (necessária para funcionar online)
1. Acesse https://console.firebase.google.com/ e crie um projeto.
2. Adicione um app Web e copie a configuração exibida.
3. Crie na raiz do repositório um arquivo chamado `firebase-config.js), copiando `firebase-config.example.js` e substituindo todos os campos de exemplo pelos valores reais.
4. No Firebase Console, ative **Authentication → Sign-in method → Email/Password**.
5. Em **Authentication → Users**, adicione o e-mail e a senha da administradora.
6. Crie o **Cloud Firestore** em modo produção.
7. Abra **Firestore Database → Rules**, cole o conteúdo de `firestore.rules` e substitua `COLOQUE_AQUI_O_EMAIL_ADMIN` pelo e-mail exato da administradora. Publique as regras.
8. Ative **Storage**, abra suas Rules, cole `storage.rules`, troque também o e-mail de administradora e publique. Se o console solicitar configuração de cobrança para Storage, siga as condições atuais do Firebase do seu projeto.
9. Faça commit de `firebase-config.js` no repositório. A Vercel fará um novo deploy automaticamente.
10. Acesse `/admin.html), entre com a conta administradora, preencha data/horário/local, envie a foto e salve.

## Importante
- O arquivo `firebase-config.js` contém a configuração pública do app web, não uma senha de servidor. Nunca publique service-account keys ou credenciais privadas.
- As regras limitam leitura das confirmações e alterações às contas autenticadas com o e-mail de administradora indicado nas regras. Use apenas a conta autorizada para administração.
- Convidados podem enviar nomes e acompanhantes; só a administradora pode ler a lista.
- O formulário só registra confirmações depois que Firebase estiver configurado e as regras publicadas.
