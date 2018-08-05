class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :content, null: false
      t.integer :evaluation
      t.integer :question_id, null: false
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
