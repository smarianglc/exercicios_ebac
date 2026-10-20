# language: pt

Funcionalidade: Tela de cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Contexto:
    Dado que eu tenha um produto no carrinho
    E esteja na tela de checkout

  # Critério 1 - Deve ser cadastrado com todos os dados obrigatórios, marcados com asterisco
  Cenário: Campos obrigatórios devem estar marcados com asterisco
    Então os campos a seguir devem estar marcados com asterisco (*):
      | campo     |
      | Nome      |
      | Sobrenome |
      | País      |
      | Endereço  |
      | Cidade    |
      | CEP       |
      | Telefone  |
      | E-mail    |
    E o campo "Nome da empresa" não deve estar marcado com asterisco

  Cenário: Concluir cadastro com todos os dados obrigatórios preenchidos
    Quando eu preencher os campos obrigatórios com:
      | campo     | valor                 |
      | Nome      | Maria                 |
      | Sobrenome | Silva                 |
      | País      | Brasil                |
      | Endereço  | Rua das Flores, 100   |
      | Cidade    | São Paulo             |
      | CEP       | 01001-000             |
      | Telefone  | 11987654321           |
      | E-mail    | maria.silva@ebac.com.br |
    E deixar o campo opcional "Nome da empresa" vazio
    E clicar no botão "Finalizar compra"
    Então o cadastro deve ser concluído com sucesso
    E devo ser direcionado para a página de confirmação do pedido

  # Critério 2 - Não deve permitir e-mail com formato inválido e deve exibir mensagem de erro
  Esquema do Cenário: Não permitir cadastro com e-mail em formato inválido
    Quando eu preencher todos os campos obrigatórios com dados válidos
    Mas informar o e-mail "<email>"
    E clicar no botão "Finalizar compra"
    Então o cadastro não deve ser concluído
    E deve ser exibida a mensagem de erro "E-mail inválido"

    Exemplos:
      | situacao          | email                   |
      | sem arroba        | maria.silva.ebac.com.br |
      | sem domínio       | maria.silva@            |
      | sem usuário       | @ebac.com.br            |
      | domínio sem ponto | maria.silva@ebac        |
      | com espaço        | maria silva@ebac.com.br |
      | com dois arrobas  | maria@@ebac.com.br      |

  # Critério 3 - Ao tentar cadastrar com campos vazios deve exibir mensagem de alerta
  Esquema do Cenário: Exibir alerta ao tentar cadastrar com um campo obrigatório vazio
    Quando eu preencher todos os campos obrigatórios com dados válidos
    Mas deixar o campo "<campo>" vazio
    E clicar no botão "Finalizar compra"
    Então o cadastro não deve ser concluído
    E deve ser exibida a mensagem de alerta "Preencha os campos obrigatórios"

    Exemplos:
      | campo     |
      | Nome      |
      | Sobrenome |
      | País      |
      | Endereço  |
      | Cidade    |
      | CEP       |
      | Telefone  |
      | E-mail    |

  Cenário: Exibir alerta ao tentar cadastrar com todos os campos vazios
    Quando eu clicar no botão "Finalizar compra" sem preencher nenhum campo
    Então o cadastro não deve ser concluído
    E deve ser exibida a mensagem de alerta "Preencha os campos obrigatórios"
