class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at
end
