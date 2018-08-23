class RenameTypeColumnToCategories < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :kind, :integer
  end

  def down
    remove_column :categories, :type, :string
  end
end
