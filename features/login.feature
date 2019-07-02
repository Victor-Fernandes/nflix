#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar com meu email e senha

    @login_happy
    Cenario: Acesso
        Quando eu faço login com "tony@stark.com" e "pwd123"
        Então devo ser autenticado
        E devo ver "Tony Stark" na área logada
    
    @login_happles
    Esquema do Cenario:Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <alert>

        Exemplos:
        | email            | senha    | alert                          |
        | "tony@stark.com" | "123"    | "Usuário e/ou senha inválidos" |
        | "404@yahoo.com"  | "abc123" | "Usuário e/ou senha inválidos" |
        | ""               | "abcxde" | "Opps. Cadê o email?"          |
        | "test@test.com"  | ""       | "Opps. Cadê a senha?"          |