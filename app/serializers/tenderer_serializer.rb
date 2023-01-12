class TendererSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :tenders
end
