class AddCompleteToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :complete, :boolean, default: false
  end
end
