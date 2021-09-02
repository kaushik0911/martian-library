module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :items,
      [Types::ItemType],
      null: false,
      description: "Returns a list of items in the martian library"

    def items
      Item.preload(:user)
    end

    field :item,
      Types::ItemType,
      null: false,
      description: "Returns a item in the martian library" do

        argument :id, ID, required: true
    end
    
    def item(id: nil)
      Item.preload(:user).find(id)
    end

    field :me, Types::UserType, null: true
    def me
      context[:current_user]
    end
  end
end
