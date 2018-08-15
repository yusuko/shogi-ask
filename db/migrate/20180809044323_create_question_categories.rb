class CreateQuestionCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :question_categories do |t|
      t.integer :category_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
    add_index :users, :category_id
    add_index :users, :question_id
    add_index :users, [:category_id, :question_id], unique: true
  end
end
