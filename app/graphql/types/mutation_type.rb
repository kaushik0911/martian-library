# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_item, mutation: Mutations::CreateItem,
                        description: 'Item create request'
    field :sign_in, mutation: Mutations::SignInMutation,
                    description: 'User login request'
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
