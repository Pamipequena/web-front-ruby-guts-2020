#language: pt

Funcionalidade: Cadastrar Cliente
Como um cliente da loja online
Quero cadastrar uma conta
Para efetuar compras

@cadastro_dados_fixos
Cenário: Cadastrar cliente com dados validos fixos
Dado que acesso a pagina de login/cadastro
E solicito um novo cadastro para o email 'imersão_ruby_front9889@guts.com.br'
E preencho os campos do formulário com dados válidos fixos
Quando confirmo o cadastro
Então devo ser direcionado à página de minha conta