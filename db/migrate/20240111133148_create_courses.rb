class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses,id: false do |t|
      t.string :c_id, primary_key:true
      t.string :c_name
      t.string :teacher_id
    end

    add_foreign_key :courses, :teachers, column: :teacher_id, primary_key: :emp_id
  end
end



