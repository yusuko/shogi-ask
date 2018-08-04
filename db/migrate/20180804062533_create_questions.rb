# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.string :status, null: false, default: 'unsolved'
      t.string :title, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
