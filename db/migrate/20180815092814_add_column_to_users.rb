class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string, default: "/assets/default_user_image.png"
    add_column :users, :sentence, :string
    add_column :users, :scores, :integer, default: 0
  end
end
