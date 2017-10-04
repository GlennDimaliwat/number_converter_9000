class NumberConversion < ApplicationRecord
    # Number and Base should be present
    validates :input_number, presence: true
    validates :base, presence: true
    
    # Number and Base should be a whole numberm Number should be greater >= 0 and Base should be greater >= 2
    validates :input_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :base, numericality: { only_integer: true, greater_than_or_equal_to: 2, message: 'Base must be greater than or equal to 2'}

    
end
