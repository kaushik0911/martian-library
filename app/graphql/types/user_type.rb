# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :email, String, null: true
    field :first_name, String, null: true
    field :id, ID, null: false
    field :last_name, String, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :full_name, String, null: true
    def full_name
      # `object` references the user instance
      [object.first_name, object.last_name].compact.join(' ')
    end
  end
end
