Before do
    page.current_window.resize_to(1440, 900)

    @login_page = LoginPage.new
    @movie_page = MoviePage.new
    @sidebarView = SidebarView.new
end

Before("@login") do
    #carregando login do arquivo de configuração
    user = CONFIG["users"]["cat_manager"]
    @login_page.go
    @login_page.login(user["email"], user["pass"])
end