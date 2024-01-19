class Enrollment<ApplicationRecord
    validates :roll_no, presence: true
    validates :c_id, presence: true
    validates :marks, presence: true
end
