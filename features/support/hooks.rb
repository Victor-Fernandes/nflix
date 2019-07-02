Before do
    page.current_window.resize_to(1440, 900)

    @login_page = LoginPage.new
    @movie_page = MoviePage.new
    @sidebarView = SidebarView.new
end

Before("@login") do
    @login_page.go
    @login_page.login("tony@stark.com", "pwd123")
end