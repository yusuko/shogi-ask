class ChangeNotNullToQuestions < ActiveRecord::Migration[5.1]
  def up
    change_column_null :questions, :user_id, true
  end
end
