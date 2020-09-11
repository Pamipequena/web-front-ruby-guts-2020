Dado('que acesso a pagina de login\/cadastro') do
    @app.cadastropage.load
  end
  
  Dado('solicito um novo cadastro para o email {string}') do |email|
    @app.cadastropage.iniciar_criacao_conta email
  end
  
  Dado('preencho os campos do formulário com dados válidos fixos') do
    @app.cadastropage.preencher_form_com_dados_fixos
  end
  
  Quando('confirmo o cadastro') do
    @app.cadastropage.confirmar_cadastro
  end
  
  Dado('preencho os campos do formulário com dados validos aleatórios') do
    @app.cadastropage.preencher_form_com_dados_aleatorios
  end

  Então('devo ser direcionado à página de minha conta') do
    #expect (@app.minhacontapage.acessou_minha_conta).to be_truthy
    expect(@app.minhacontapage.page_title.text).to eq('MY ACCOUNT')
    expect(@app.minhacontapage.account_name.text).to eq(@app.cadastropage.account_full_name)
  end