class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :author

      t.timestamps
    end
  end
end
