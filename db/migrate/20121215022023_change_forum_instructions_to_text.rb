class ChangeForumInstructionsToText < ActiveRecord::Migration
  def up
    change_column :forums, :instructions, :text
  end

  def down
    change_column :forums, :instructions, :string
  end
end