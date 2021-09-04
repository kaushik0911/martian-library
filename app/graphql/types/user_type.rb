# frozen_string_literal: true

# rubocop:disable GraphQL/FieldDescription
module Types
  class UserType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :email, String, null: true
    field :first_name, String, null: true
    field :id, ID, null: false
    field :last_name, String, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :fullname,
          String,
          null: true,
          description: 'Returns user fullname'
    def fullname
      # `object` references the user instance
      [object.first_name, object.last_name].compact.join(' ')
    end
  end
end
# rubocop:enable GraphQL/FieldDescription
