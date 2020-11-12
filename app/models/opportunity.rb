class Opportunity < ApplicationRecord
    # add some validations here
    validates :organisation, presence: true,
                    length: { minimum: 5 }
    validates :title, presence: true,
                    length: { minimum: 5 }
    validates :location, presence: true,
                    length: { minimum: 5 }
    validates :description, presence: true,
                    length: { minimum: 5 }
    has_one_attached :image
    belongs_to :user
end
