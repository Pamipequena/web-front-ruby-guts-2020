#language: pt

@regressivo
Funcionalidade: Cadastrar cliente
Como um cliente da loja online
Quero cadastrar uma conta
Para efetuar compras

@cadastro_exemplos
Esquema do Cenário: Cadastrar cliente com dados validos
Dado que acesso a pagina de login/cadastro
E solicito um novo cadastro para o email <email>
E preencho os campos do formulario com <gender>, <first_name>, <last_name>, <password>, <day>, <month>, <year>, <newsletter>, <address>, <city>, <zipcode>, <state>, <phone>, <address_name>
Quando confirmo o cadastro
Então devo ser direcionado à página de minha conta 
Exemplos:
| email                        | gender | first_name | last_name |     password    | day  |    month    |   year   | newsletter |     address     |     city        |    zipcode    |     state       |       phone         | address_name    |
|  'paula_ruby14@guts.com'     | 'fem'  |  'Paula'   |  'Silva'  |    '12345678'   | '20' |   'March'   |  '1980'  |   'no'     | 'Rua Lui, 80'   |   'Alvorada'    |    '00000'    |   'Indiana'     |   '5552987548251'   | 'apartamento'   |
|  'joao_ruby14@guts.com'      | 'masc' |  'João'    |  'Santos' |    '89101212'   | '15' |   'April'   |  '1990'  |   'yes'    | 'Rua Alfeu, 50' |   'Viamão'      |    '00000'    |   'Georgia'     |   '5571589321589'   |  'casa'         |