#language: pt

Funcionalidade: Cadastrar Cliente
Como um cliente da loja online
Quero cadastrar uma conta
Para efetuar compras

@cadastro_dados_faker
Cenário: Cadastrar cliente com dados validos aleatorios
Dado que acesso a pagina de login/cadastro
E solicito um novo cadastro para o email 'aleatorio'
E preencho os campos do formulário com dados válidos fixos
Quando confirmo o cadastro
Então devo ser direcionado à página de minha conta