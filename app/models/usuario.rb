class Usuario < ApplicationRecord
    has_secure_password #si no hay token no deja entrar
    validates :email, presence:
    
    
    def to_token_payload
        {
            sub: id,
            email: email
        }
    end

end
