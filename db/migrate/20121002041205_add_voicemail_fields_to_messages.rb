class AddVoicemailFieldsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :viewed, :boolean, :default => false
    add_column :messages, :responded_to, :boolean, :default => false
    add_column :messages, :resolved, :boolean, :default => false
    add_column :messages, :kind, :string, :default => 'website'
    add_column :messages, :contact_id, :string
    add_column :messages, :audio_url, :string
    add_column :messages, :audio_duration, :integer, :default => 0
    rename_column :messages, :from, :contact_name
    rename_column :messages, :reply_to, :contact_details
  end
end