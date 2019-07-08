require 'pg'

class Database
  def delete_movie(title)
    #Conectando ao BD para executar script para deletar filme
    connection = PG.connect(host: '127.0.0.1', dbname: 'nflix', user: 'postgres', password: 'qaninja')
    connection.exec("DELETE from public.movies where title = '#{title}';")
  end
end
