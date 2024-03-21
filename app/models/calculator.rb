class Calculator
    def self.add(numbers)
        return 0 if numbers.blank?

        numbers.split(/[\n,]/).map(&:to_i).sum
    end
end