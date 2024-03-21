class Calculator
    def self.add(numbers)
        return 0 if numbers.blank?

        numbers_array = numbers.split(/[\n,]+/)
        return "Numbers value is invalid" if numbers_array.any?(&:empty?) || numbers =~ /(?:\n,|,\n)/

        numbers_array.map(&:to_i).sum
    end
end