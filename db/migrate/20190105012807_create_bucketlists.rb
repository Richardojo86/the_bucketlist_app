class CreateBucketlists < ActiveRecord::Migration[5.2]
  def change
    create_table :bucketlists do |t|
      t.string :name 
      t.timestamps
    end
  end
end
