class Students < ActiveRecord::Migration[6.0]
  def change
    create_table :students, id: false do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :roll_no, primary_key: true
    end
  end
end
