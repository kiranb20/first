class Course<ApplicationRecord
    validates :c_id, presence:true, length: {maximum:100}
    validates :c_name, presence:true
    validates :teacher_id, presence:true
end
