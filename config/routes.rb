# frozen_string_literal: true

Rails.application.routes.draw do
  mount_graphql_devise_for 'User', at: 'graphql_auth'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
