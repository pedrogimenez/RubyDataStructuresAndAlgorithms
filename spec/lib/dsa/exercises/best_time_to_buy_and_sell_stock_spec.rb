require_relative '../../../spec_helper'

describe DSA::Exercises::BestTimeToBuyAndSellStock do
  test_cases = [
    { input: [7, 1, 5, 3, 6, 4], output: 5 },
    { input: [7, 6, 4, 3, 1], output: 0 },
    { input: [], output: 0 },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} should return #{test_case[:output]}" do
      expect(subject.get_maximum_profit(test_case[:input])).to eq(test_case[:output])
    end
  end
end
