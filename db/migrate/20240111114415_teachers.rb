class Teachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers, id: false do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :emp_id, primary_key: true
    end
  end
end
