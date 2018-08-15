class RenameTypeColumnToCategories < ActiveRecord::Migration[5.1]
  def up
    add_column :Categories, :kind, :integer
  end

  def down
    remove_column :Categories, :type, :string
  end
end
