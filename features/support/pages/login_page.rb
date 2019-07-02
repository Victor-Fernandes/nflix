class LoginPage
  include Capybara::DSL
  def go
    visit '/'
  end

  def login(email, senha)
    find('#emailId').set email
    find('#passId').set senha
    click_button 'Entrar'
  end

  def alert
    find(".alert").text
  end
end
