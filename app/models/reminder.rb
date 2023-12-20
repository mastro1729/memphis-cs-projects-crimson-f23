class Reminder < ApplicationRecord
    validates :title, presence: { message: 'must be provided' }
    validates :description, presence: { message: 'must be provided' }
    validates :date, presence: { message: 'must be provided' }
    validate :date_cannot_be_in_the_past
  
    belongs_to :customer, optional: true

    private

    def date_cannot_be_in_the_past
      if date.present? && date < Date.today
        errors.add(:date, 'cannot be in the past')
      end
    end
end
