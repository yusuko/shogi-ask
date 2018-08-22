class RemoveStatusFromQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :status, :string
    add_column :questions, :best_reply_id, :integer
  end
end
