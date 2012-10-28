class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.string :author, :default => "Anonymous"
      t.string :title
      t.text :body
      t.integer :forum_id
      t.integer :views, :default => 0

      t.timestamps
    end
  end
end
