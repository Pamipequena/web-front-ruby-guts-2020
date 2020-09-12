#language: pt

Funcionalidade: Cadastrar Cliente
Como um cliente da loja online
Quero cadastrar uma conta
Para efetuar compras

@cadastro_datafile
Cenário: Cadastrar cliente com dados validos de arquivo externo
Dado que acesso a pagina de login/cadastro
E solicito um novo cadastro para o email 'padrao'
E preencho os campos do formulário com dados válidos padrão
Quando confirmo o cadastro
Então devo ser direcionado à página de minha conta