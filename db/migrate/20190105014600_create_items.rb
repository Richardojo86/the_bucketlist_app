class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.references :bucketlist, references: :bucketlists, index: true, null: false
      t.timestamps
    end
  end
end
