# OAuth

Framework de autorização que permite aplicações de terceiros obterem acesso limitado a recursos protegidos de um usuário num servidor HTTP, sem compartilhar credenciais.

OAuth 2.0 é um protocolo de delegação que permite usuários conceder acesso a coisas em seu nome.

O cliente faz requisição ao servidor de autorização que fornece **tokens de acesso**, estes permitem acesso aos recursos em outros servidores em nome do usuário.

### Autenticação X Autorização

|Autenticação|Autorização|
|-|-|
|Determina se usuários são quem se identificam|Determina o acesso a recursos já autenticados|
|Valida credenciais do usuário|Verifica acesso por políticas e regras|
|Transmite informação por **ID Token**|Transmite informação por **Token de Acesso**|
|Geralmente usa OpenID Connect Protocol|Geralmente usa OAuth2.0|

#### Papéis no fluxo

- Proprietário do Recurso: Usuário que concede acesso aos dados;
- Aplicação Cliente: Solicita acesso aos dados do usuário;
- Servidor de Autorização: Fornece tokens de acesso após autenticar usuário;
- Servidor de Recursos: Aceita os tokens permitindo acesso aos recursos hospedados;

### Tipos de Fluxo de Autorização (Grant Type)

- Authorization Code
- PKCE
- Client Credentials
- Device Code
- Refresh Token
- Implicit Flow (legado)
- Password Grant (legado)

##### Fluxo Implícito

Não usa outra aplicação para acessar o client software desde que o client esteja contido no browser.

> Sem necessidade de usar OAuth em aplicações que têm APIs próprias que podem ou não conseguem usar cookies. *Somente usar OAuth com terceiros*.

##### Fluxo de Credenciais de Cliente

> Por que não usar chave de API diretamente, sendo que o servidor de autorização devolve uma?

O servidor de autorização consegue produzir a chave de acesso.

O client software troca suas credenciais por um token de acesso.

##### Fluxo de Senha do Dono dos Recursos

O client software troca o nome de usuário e senha com o servidor de OAuth pelo token de acesso.

O usuário precisa confiar no client para que suas credenciais não serão salvas de forma maliciosa. 

##### Fluxo de Afirmações

SAML: Simple Assertion Markup Language

Transfere um documento de afirmação (assertion) e troca-o pelo token de acesso com o servidor de autorização.

##### Fluxo de Dispositivo

Dispositivo requisita um código de usuário para o servidor de autorização, apresenta ao usuário que precisa enviar esse código de volta ao servidor de autorização para permitir que o dispositivo tenha acesso ao servidor de dados.

##### PKCE (Proof Key for Code Exchange)

Client software gera um código de verificação e encaminha ao usuário. Usuário envia um hash desse código ao servidor de autorização (**code challenge**).

Quando o client fazer a requisição para o servidor de autorização novamente, o servidor recalcula o hash e valida o code challenge.

### Conceitos

- O núcleo do protocolo é definido apenas para HTTP
- Depende de TLS para comunicação segura
- Não autoriza outro usuário
- Não existe padrão de token de acesso (JWT é convenção)
- Não depende de métodos de criptografia
- Não é protocolo de autenticação

### Clientes Nativos (desktop ou móvel)

Funciona fora de um navegador, sem conseguir salvar as credenciais do usuário.

Pela aplicação ser compilada, precisa ter um mecanismo de criar credencial por instância.
> Gerenciamento da quantidade de token de acesso.

Aplicações públicas (sem login) compartilham das mesmas credenciais.

![Diagrama para escolher melhor fluxo de autorização](./assets/chooseShart.png)

[OAuth 2.0](https://oauth.net/2/)
[OAuth 2.0 RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749)
[OAuth 2.0 Master Class](https://www.youtube.com/watch?v=TVrme-iZIt0&ab_channel=Identiverse-ACRAResource)

# OAuth 2.0 x Google Workspace
https://developers.google.com/identity/protocols/oauth2?hl=pt-br

https://developers.google.com/workspace/gmail/imap/xoauth2-protocol?hl=pt-br

# OAuth 2.0 x Microsoft 365

https://learn.microsoft.com/pt-br/entra/architecture/auth-oauth2

https://learn.microsoft.com/en-us/exchange/client-developer/legacy-protocols/how-to-authenticate-an-imap-pop-smtp-application-by-using-oauth