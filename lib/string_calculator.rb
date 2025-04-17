class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1] 
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select { |n| n < 0 }

    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end
end
