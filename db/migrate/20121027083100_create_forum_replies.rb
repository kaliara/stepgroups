class CreateForumReplies < ActiveRecord::Migration
  def change
    create_table :forum_replies do |t|
      t.string :author, :default => "Anonymous"
      t.text :body
      t.integer :forum_post_id

      t.timestamps
    end
  end
end
