module Helpers

    def getToken
        # pegando o token de sessão do usuario
        js_script = 'return window.localStorage.getItem("default_auth_token");'
        page.execute_script(js_script) # executando comando js
    end
end