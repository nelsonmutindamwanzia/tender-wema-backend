class TenderSerializer < ActiveModel::Serializer
  attributes :id, :tender_name, :tender_category, :tender_description, :timeline, :application_deadline, :budget, :tenderer_id
end
