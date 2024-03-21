class Calculator

    def self.add(numbers)
        return 0 if numbers.blank?

        # Setting the delimiter as "," because the first step in creating the calculator is separating the numbers by comma
        delimiter = ","
        if numbers.start_with?("//")
            # Using Regexp.escape here to get the delimiter as it returns a new string by escaping 
            # any characters that would have special meaning since we are using regular expression below
            delimiter = Regexp.escape(numbers[2])
            numbers = numbers.sub(/^\/\/.\n/, '')
        end

        # Keeping the new line and the delimiter here because step 3 says to separate numbers with new line as well
        numbers_array = numbers.split(/[\n#{delimiter}]+/)

        return "Numbers value is invalid" if numbers_array.any?(&:empty?) || numbers =~ /(?:\n#{delimiter}|#{delimiter}\n)/
        numbers_array.map(&:to_i).sum
    end
end