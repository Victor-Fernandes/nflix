class MoviePage
    include Capybara::DSL

    def add
        find(".nc-simple-add").click
    end
    
    def upload(file)
        #upload cover img, element it's hidden. Configure capybara for find element hiden 
        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)

        cover_file = cover_file.tr("/", "\\") if OS.windows? #se for windows ele inverte as barras
 
        Capybara.ignore_hidden_elements = false
        attach_file('upcover', cover_file)
        Capybara.ignore_hidden_elements = true
    end
    
    def add_cast(cast)
        #add cast
        actor = find(".input-new-tag")
        cast.each do |a|
            actor.set a
            actor.send_keys :tab
        end
    end

    def alert
        find(".alert").text
    end

    def selec_status(status)
        # combobox - customizado com Lis
        find("input[placeholder=Status]").click
        find(".el-select-dropdown__item", text: status).click
    end

    def create(movie)
        find("input[name=title]").set movie["title"]

        #se status for null não é executada
        selec_status(movie["status"]) unless movie["status"].empty?
        
        #se year for null não é executada
        find("input[name=year]").set movie["year"]

        find("input[name=release_date]").set movie["release_date"]
        add_cast(movie["cast"])

        find("textarea[name=overview]").set movie["overview"]

        #se cover for null não é executada
        upload(movie["cover"]) unless movie["cover"].empty?

        find("#create-movie").click
    end

    def movie_tr(title)
        #validando pela linha da tabele, para confirma cadastro do filme
        find("table tbody tr", text: title)
    end

    def remove(title)
        movie_tr(title).find(".btn-trash").click       
    end

    def swal2_confirm
        find(".swal2-confirm").click
    end

    def swal2_cancel
        find(".swal2-cancel").click
    end

    #validando que foi excluido, return true caso tenha sido excluido
    def has_no_movie(title)
        page.has_no_css?("table tbody tr", text: title)
    end

    def has_movie(title)
        page.has_css?("table tbody tr", text: title )
    end
    
end