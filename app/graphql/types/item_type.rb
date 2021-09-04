# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :description, String, null: true
    field :id, ID, null: false
    field :image_url, String, null: true
    field :title, String, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: false
    field :user_id, Integer, null: false
  end
end
