module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :sign_in, mutation: Mutations::SignInMutation
    field :create_item, mutation: Mutations::CreateItem
  end
end
