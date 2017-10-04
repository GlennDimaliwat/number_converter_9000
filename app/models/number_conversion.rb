class NumberConversion < ApplicationRecord
    # Number and Base should be present
    validates :input_number, presence: true
    validates :base, presence: true
    
    # Number and Base should be a whole numberm Number should be greater >= 0 and Base should be greater >= 2
    validates :input_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :base, numericality: { only_integer: true, greater_than_or_equal_to: 2, message: 'Base must be greater than or equal to 2'}

    # Number to Base X
    DIGITS = ('0'..'9').to_a + ('A'..'Z').to_a
    def number_to_base
        number = self.input_number
        base = self.base

        return '0' if number == 0
        return 'indeterminate' if base < 2

        output = ''
        while number > 0
            bit = number % base
            letter = DIGITS[bit]
            output = letter + output
            number = number / base
        end
        output
    end
    
end
