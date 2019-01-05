class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :bucketlist_id
end
