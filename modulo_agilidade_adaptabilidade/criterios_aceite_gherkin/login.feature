# language: pt

Funcionalidade: Login na plataforma
  Como cliente da EBAC-SHOP
  Quero fazer o login (autenticação) na plataforma
  Para visualizar meus pedidos

  Contexto:
    Dado que eu esteja na página de login da EBAC-SHOP
    E que exista o cliente cadastrado com o usuário "cliente@ebac.com.br" e a senha "Senha@123"

  Cenário: Login com usuário e senha válidos
    Quando eu informar o usuário "cliente@ebac.com.br" e a senha "Senha@123"
    E clicar no botão "Login"
    Então devo ser direcionado para a tela de checkout

  Esquema do Cenário: Login com usuário ou senha inválidos
    Quando eu informar o usuário <usuario> e a senha <senha>
    E clicar no botão "Login"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

    Exemplos:
      | usuario                 | senha     |
      | cliente@ebac.com.br     | Senha@999 |
      | inexistente@ebac.com.br | Senha@123 |
      | inexistente@ebac.com.br | Senha@999 |
      | cliente@ebac.com.br     | senha@123 |
