# language: pt

Funcionalidade: Login na plataforma
  Como cliente da EBAC-SHOP
  Quero fazer o login (autenticação) na plataforma
  Para visualizar meus pedidos

  Contexto:
    Dado que eu esteja na página de login da EBAC-SHOP
    E que exista o cliente cadastrado com o usuário "cliente@ebac.com.br" e a senha "Senha@123"

  # Critério 1 - Ao inserir dados válidos deve ser direcionado para a tela de checkout
  Cenário: Login com usuário e senha válidos
    Quando eu informar o usuário "cliente@ebac.com.br" e a senha "Senha@123"
    E clicar no botão "Login"
    Então devo ser direcionado para a tela de checkout

  # Critério 2 - Ao inserir um dos campos inválidos deve exibir a mensagem "Usuário ou senha inválidos"
  Esquema do Cenário: Login com usuário ou senha inválidos
    Quando eu informar o usuário "<usuario>" e a senha "<senha>"
    E clicar no botão "Login"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

    Exemplos:
      | situacao                       | usuario                  | senha       |
      | senha inválida                 | cliente@ebac.com.br      | Senha@999   |
      | usuário inválido               | inexistente@ebac.com.br  | Senha@123   |
      | usuário e senha inválidos      | inexistente@ebac.com.br  | Senha@999   |
      | senha com letras trocadas      | cliente@ebac.com.br      | senha@123   |
