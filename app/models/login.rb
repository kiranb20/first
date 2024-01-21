class Login<ApplicationRecord
    validates :username, presence: true,length: {minimum: 6, maximum: 20}
    validates :password, presence: true, length: {minimum:8 , maximum:15}
    def generate_jwt
        expiration_time = 1.day.from_now.to_i
        payload = { user_id: username, exp: expiration_time }
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end
end
