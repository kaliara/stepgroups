class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.text :value
      t.boolean :published, :default => false

      t.timestamps
    end
  end
end
