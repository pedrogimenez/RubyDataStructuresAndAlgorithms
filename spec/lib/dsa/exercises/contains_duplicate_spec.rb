require_relative '../../../spec_helper'

describe DSA::Exercises::ContainsDuplicate do
  test_cases = [
    { input: [1, 2, 3, 1], output: true },
    { input: [1, 2, 3, 4], output: false },
    { input: [1, 1, 1, 3, 3, 4, 3, 2, 4, 2], output: true },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} should return #{test_case[:output]}" do
      expect(subject.contains_duplicate?(test_case[:input])).to eq(test_case[:output])
    end
  end
end
