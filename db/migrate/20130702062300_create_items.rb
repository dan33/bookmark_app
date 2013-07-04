class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.string :description
      t.integer :topic_id

      t.timestamps
    end
  end
end
