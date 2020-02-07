require_relative '../../../spec_helper'

describe DSA::Exercises::ProductOfArrayExceptSelf do
  test_cases = [
    { input: [1, 2, 3, 4], output: [24,12,8,6] },
    { input: [-1, -1, -1], output: [1, 1, 1] },
    { input: [-2, -2, -2], output: [4, 4, 4] },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} should return #{test_case[:output]}" do
      expect(subject.product(test_case[:input])).to eq(test_case[:output])
    end
  end
end
