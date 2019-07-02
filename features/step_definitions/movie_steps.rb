Dado("que {string} é um novo filme") do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    @movie = file[movie_code]
end
  
Quando("eu faço um cadastro deste filme") do
    @movie_page.add
    @movie_page.create(@movie)
    sleep 4
end
  
Então("deve ver o filme no catalogo") do
    
end