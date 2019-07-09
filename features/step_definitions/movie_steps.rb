Dado('que {string} é um novo filme') do |movie_code|
  # pegando o arquivo yaml onde fica a massa de testes
  file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml'))
  @movie = file[movie_code]
  Database.new.delete_movie(@movie['title']) # Deletar filme antes de realizar os testes
end

Dado('este filme já existe no catálogo') do
  Database.new.insert_movie(@movie) # garantindo que o filme esta no catalogo
end

Quando('eu faço um cadastro deste filme') do
  @movie_page.add
  @movie_page.create(@movie)
end

Então('deve ver o filme no catalogo') do
  result = @movie_page.movie_tr(@movie)
  expect(result).to have_text @movie['title']
  expect(result).to have_text @movie['status']
end

# Cadastro sem title
Então('devo ver a notificação {string}') do |expect_alert|
  expect(@movie_page.alert).to eql expect_alert
end

Dado('que {string} está do catálogo') do |movie_code|
  steps %{ 
    Dado que "#{movie_code}" é um novo filme
    E este filme já existe no catálogo
  }#utilizando dinamic steps para garantir que filme esteja no catalogo
end

Quando('eu solicito a exclusão') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('eu confirmo a solicitação') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('este item deve ser removido do catálogo') do
  pending # Write code here that turns the phrase above into concrete actions
end
