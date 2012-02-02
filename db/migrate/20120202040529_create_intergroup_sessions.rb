class CreateIntergroupSessions < ActiveRecord::Migration
  def change
    create_table :intergroup_sessions do |t|
      t.datetime :session_date
      t.integer :attendance, :default => 0
      t.boolean :quorum, :default => false

      t.timestamps
    end
  end
end
