module Helpers

    def getToken
        timeout = Capybara.default_max_wait_time
        #codigo para esperar por mais tempo pela geração do token
        timeout.times do
            # pegando o token de sessão do usuario
            js_script = 'return window.localStorage.getItem("default_auth_token");'
            @token = page.execute_script(js_script) # executando comando js
            sleep 1
        end
        @token
    end
end