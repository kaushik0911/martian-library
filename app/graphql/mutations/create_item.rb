# frozen_string_literal: true

module Mutations
  class CreateItem < Mutations::BaseMutation
    null true

    argument :description, String, required: false
    argument :image_url, String, required: false
    argument :title, String, required: true

    field :errors, [String], null: false
    field :item, Types::ItemType, null: false

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
