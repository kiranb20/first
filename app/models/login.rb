class Login<ApplicationRecord
    validates :username, presence: true,length: {minimum: 6, maximum: 20}
    validates :password, presence: true, length: {minimum:8 , maximum:15}
end
