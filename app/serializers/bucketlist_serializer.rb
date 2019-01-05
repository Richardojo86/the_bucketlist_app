class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :date

  def date
    object.created_at.strftime ("%m, %y") 
  end
end
