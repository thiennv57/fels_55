class AddIndexToAnswer < ActiveRecord::Migration
  def change
    add_index :answers, :word_id, unique: true
  end
end
