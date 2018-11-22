module ApplicationHelper
    def mostra_usuario_atual
       p current_user if user_signed_in?
    end
end
