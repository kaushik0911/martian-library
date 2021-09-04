# frozen_string_literal: true

module Mutations
  class SignInMutation < Mutations::BaseMutation
    argument :email, String, required: true,
                             description: 'Provide user email'

    field :token, String, null: true,
                          description: 'User token to communicate'
    field :user, Types::UserType, null: true,
                                  description: 'User object'

    def resolve(email:)
      user = User.find_by!(email: email)
      return {} unless user

      token = Base64.encode64(user.email)
      {
        token: token,
        user: user
      }
    end
  end
end
