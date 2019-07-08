require 'pg'

class Database

  def initialize
    #Conectando ao BD
    @connection = PG.connect(host: '127.0.0.1', dbname: 'nflix', user: 'postgres', password: 'qaninja')         
  end

  def delete_movie(title)
    #Executar script para deletar filme
    @connection.exec("DELETE from public.movies where title = '#{title}';")
  end

  def insert_movie(movie)
    #Adicionar filme atraves do script
    #string d linha dupla> utilizar "\"
    sql_script = "INSERT INTO public.movies (title, status, year, release_date, created_at, updated_at)" \
	" VALUES('#{movie["title"]}', '#{movie["status"]}', '#{movie["year"]}', '#{movie["release_date"]}', current_timestamp, current_timestamp);"
    @connection.exec(sql_script)
  end
end