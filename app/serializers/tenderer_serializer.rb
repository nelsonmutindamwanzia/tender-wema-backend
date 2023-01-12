class TendererSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :tenders
  has_many :suppliers, through: :tenders
end
