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
end
