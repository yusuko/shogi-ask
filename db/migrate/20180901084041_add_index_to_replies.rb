class AddIndexToReplies < ActiveRecord::Migration[5.1]
  def change
    add_index :replies, :question_id
    add_index :comments, :reply_id
  end
end
