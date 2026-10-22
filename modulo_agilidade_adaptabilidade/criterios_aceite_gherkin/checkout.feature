# language: pt

Funcionalidade: Tela de cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Contexto:
    Dado que eu tenha um produto no carrinho
    E esteja na tela de checkout

  Cenário: Concluir cadastro com todos os dados obrigatórios preenchidos
    Quando eu preencher o nome "Maria", o sobrenome "Silva", o país "Brasil", o endereço "Rua das Flores, 100", a cidade "São Paulo", o CEP "01001-000", o telefone "11987654321" e o e-mail "maria.silva@ebac.com.br"
    E clicar no botão "Finalizar compra"
    Então o cadastro deve ser concluído com sucesso
    E devo ser direcionado para a página de confirmação do pedido

  Esquema do Cenário: Não permitir cadastro com e-mail em formato inválido
    Quando eu preencher todos os campos obrigatórios com dados válidos
    Mas informar o e-mail <email>
    E clicar no botão "Finalizar compra"
    Então o cadastro não deve ser concluído
    E deve ser exibida a mensagem de erro "E-mail inválido"

    Exemplos:
      | email                   |
      | maria.silva.ebac.com.br |
      | maria.silva@            |
      | @ebac.com.br            |
      | maria.silva@ebac        |
      | maria silva@ebac.com.br |
      | maria@@ebac.com.br      |

  Esquema do Cenário: Exibir alerta ao tentar cadastrar com um campo obrigatório vazio
    Quando eu preencher todos os campos obrigatórios com dados válidos
    Mas deixar o campo <campo> vazio
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
