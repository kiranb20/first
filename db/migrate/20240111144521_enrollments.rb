class Enrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.string :roll_no
      t.string :c_id
      t.string :marks
    end

    add_foreign_key :enrollments, :students, column: :roll_no, primary_key: :roll_no
    add_foreign_key :enrollments, :courses, column: :c_id, primary_key: :c_id

  end
end







# db/migrate/YYYYMMDDHHMMSS_create_enrollments.rb


# db/migrate/YYYYMMDDHHMMSS_create_enrollments.rb

class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.string :student_name
      t.string :course_name
      t.integer :marks

    end

    add_foreign_key :enrollments, :students, column: :student_name, primary_key: :username
    add_foreign_key :enrollments, :courses, column: :course_name, primary_key: :name
  end
end