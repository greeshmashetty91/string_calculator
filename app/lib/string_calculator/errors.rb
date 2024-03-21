module StringCalculator
    module Errors
        class NegativeNumberFound < StandardError
        end

        class InvalidNumber < StandardError
        end
    end
end