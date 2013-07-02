class AddTopicIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :topic_id, :integer
  end
end
