Dado("que {string} é um novo filme") do |movie_code|
    #pegando o arquivo yaml onde fica a massa de testes
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    @movie = file[movie_code]
    Database.new.delete_movie(@movie["title"]) #Deletar filme antes de realizar os testes
end
  
Dado("este filme já existe no catálogo") do
    Database.new.insert_movie(@movie)
end  

Quando("eu faço um cadastro deste filme") do
    @movie_page.add
    @movie_page.create(@movie)
end
  
Então("deve ver o filme no catalogo") do
    result = @movie_page.movie_tr(@movie)
    expect(result).to have_text @movie["title"]
    expect(result).to have_text @movie["status"]
end

#Cadastro sem title
Então("devo ver a notificação {string}") do |expect_alert|
    expect(@movie_page.alert).to eql expect_alert
end