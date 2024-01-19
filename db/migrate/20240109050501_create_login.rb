class CreateLogin < ActiveRecord::Migration[6.0]
  def change
    create_table :logins do |t|
      t.string :username
      t.string :password
    end
  end
end
