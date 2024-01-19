class UserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :userdetails do |t|
      t.string :email
      t.string :password
    end
  end
end
