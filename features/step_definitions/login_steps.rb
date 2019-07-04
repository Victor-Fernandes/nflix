Quando('eu faço login com {string} e {string}') do |email, senha|
  @login_page.go
  @login_page.login(email, senha)
end

Então('devo ser autenticado') do
  expect(getToken.length).to be 147 # validando pelo qtd d strings do token
end

Então('devo ver {string} na área logada') do |expect_name|
  expect(@sidebarView.logged_user).to eql expect_name
end

Então('não devo ser autenticado') do
  expect(getToken).to be nil # verificando se o token é null(nil)
end

Então('devo ver a mensagem de alerta {string}') do |expect_msg|
  expect(@login_page.alert).to eql expect_msg
end
