class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end
end





# db/migrate/YYYYMMDDHHMMSS_create_enrollments.rb

