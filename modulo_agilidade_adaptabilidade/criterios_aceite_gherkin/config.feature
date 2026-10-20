# language: pt

Funcionalidade: Configurar produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto e escolher a quantidade
  Para depois inserir no carrinho

  Contexto:
    Dado que eu esteja na página do produto "Augusta Pullover Jacket"

  # Critério 1 - Seleções de cor, tamanho e quantidade devem ser obrigatórias
  Cenário: Adicionar produto ao carrinho com cor, tamanho e quantidade selecionados
    Quando eu selecionar a cor "Blue", o tamanho "M" e a quantidade "2"
    E clicar no botão "Comprar"
    Então o produto deve ser adicionado ao carrinho com a cor "Blue", o tamanho "M" e a quantidade "2"

  Esquema do Cenário: Não permitir adicionar ao carrinho sem as seleções obrigatórias
    Quando eu selecionar a cor "<cor>", o tamanho "<tamanho>" e a quantidade "<quantidade>"
    E clicar no botão "Comprar"
    Então o produto não deve ser adicionado ao carrinho
    E deve ser exibida a mensagem "Selecione cor, tamanho e quantidade antes de adicionar ao carrinho"

    Exemplos:
      | cor    | tamanho | quantidade |
      |        | M       | 1          |
      | Orange |         | 1          |
      | Red    | L       |            |
      | Blue   | XS      | 0          |
      |        |         |            |

  # Critério 2 - Deve permitir apenas 10 produtos por venda
  Esquema do Cenário: Permitir adicionar até 10 produtos por venda
    Quando eu selecionar a cor "Red", o tamanho "S" e a quantidade "<quantidade>"
    E clicar no botão "Comprar"
    Então o produto deve ser adicionado ao carrinho com a quantidade "<quantidade>"

    Exemplos:
      | quantidade |
      | 1          |
      | 9          |
      | 10         |

  Esquema do Cenário: Não permitir mais de 10 produtos por venda
    Quando eu selecionar a cor "Red", o tamanho "S" e a quantidade "<quantidade>"
    E clicar no botão "Comprar"
    Então o produto não deve ser adicionado ao carrinho
    E deve ser exibida a mensagem "É permitido no máximo 10 produtos por venda"

    Exemplos:
      | quantidade |
      | 11         |
      | 20         |

  Cenário: Não permitir ultrapassar 10 produtos somando com o que já está no carrinho
    Dado que eu já tenha 8 unidades deste produto no carrinho
    Quando eu selecionar a cor "Blue", o tamanho "XL" e a quantidade "3"
    E clicar no botão "Comprar"
    Então o produto não deve ser adicionado ao carrinho
    E deve ser exibida a mensagem "É permitido no máximo 10 produtos por venda"

  # Critério 3 - Ao clicar no botão "Limpar" deve voltar ao estado original
  Cenário: Limpar as seleções do produto
    Dado que eu tenha selecionado a cor "Orange", o tamanho "L" e a quantidade "3"
    Quando eu clicar no botão "Limpar"
    Então nenhuma cor deve estar selecionada
    E nenhum tamanho deve estar selecionado
    E a quantidade deve voltar para o valor padrão "1"
