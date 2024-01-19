class Teacher<ApplicationRecord
    validates :name, presence:true, length: {maximum:100}
    validates :email, presence:true
    validates :password, presence:true, length: {minimum:6 , maximum:20}
    validates :emp_id, presence: true
end
