require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(calculator.add("")).to eq(0)
      end
    end

    context 'when the input is a single number' do
      it 'returns the number itself' do
        expect(calculator.add("1")).to eq(1)
        expect(calculator.add("5")).to eq(5)
      end
    end

    context 'when the input contains multiple numbers' do
      it 'returns the sum of numbers' do
        expect(calculator.add("1,5")).to eq(6)
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when the input contains custom delimiter' do
      it 'returns the sum of numbers with a custom delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
        expect(calculator.add("//|\n1|2|3")).to eq(6)
      end
    end

    context 'when the input contains negative numbers' do
      it 'raises an error with a message listing negative numbers' do
        expect { calculator.add("1,-2,3,-4") }.to raise_error("Negative numbers not allowed: -2, -4")
      end
    end

    context 'when the input contains a mix of valid and invalid delimiters' do
      it 'handles the input properly and returns the sum' do
        expect(calculator.add("//;\n1;2;3")).to eq(6)
        expect(calculator.add("//|\n4|5|6")).to eq(15)
      end
    end
  end
end
