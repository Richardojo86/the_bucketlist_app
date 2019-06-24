class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :bucketlist_id
  belongs_to :bucketlist
end
