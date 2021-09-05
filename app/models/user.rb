# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # , :trackable ,:confirmable, :omniauthable
  include GraphqlDevise::Concerns::Model
  has_many :items, dependent: :destroy
end
