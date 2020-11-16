class Opportunity < ApplicationRecord
  # validates and sanitises all input
    validates :organisation,
        presence: true,
        length: { minimum: 6 }

    validates :title,
        presence: true,
        length: { minimum: 6 }

    validates :location,
        presence: true,
        length: { minimum: 4 }

    validates :description,
        presence: true,
        length: { minimum: 10 }

    # One opportunity listing has zero or one image
    has_one_attached :image

    # An opportunity can only belong to one user
    belongs_to :user
end
