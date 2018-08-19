class RemoveTopicIdFromReplies < ActiveRecord::Migration[5.1]
  def change
    remove_column :replies, :topic_id, :integer
  end
end
