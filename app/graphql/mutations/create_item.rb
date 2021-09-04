# frozen_string_literal: true

module Mutations
  class CreateItem < Mutations::BaseMutation
    null true

    argument :description, String, required: false, description: 'This is the item disciprion'
    argument :image_url, String, required: false, description: 'Image resource path'
    # rubocop:disable GraphQL/ExtractInputType
    argument :title, String, required: true, description: 'Item title, can also used for img alt attribute'
    # rubocop:enable GraphQL/ExtractInputType

    field :errors, [String], null: false, description: 'Error exceptions'
    field :item, Types::ItemType, null: false, description: 'Item object'

    def resolve(title:, description: nil, image_url: nil)
      item = Item.new(
        title: title,
        description: description,
        image_url: image_url,
        user_id: 1
      )

      if item.save
        {
          item: item,
          errors: []
        }
      else
        {
          item: nil,
          errors: [item.errors.full_messages]
        }
      end
    end
  end
end
