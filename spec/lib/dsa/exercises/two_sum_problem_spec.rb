require_relative '../../../spec_helper'

describe DSA::Exercises::TwoSumProblem do
  test_cases = [
    { input: [2, 7, 11, 15], target: 9, output: [0, 1] },
    { input: [3, 2, 4], target: 6, output: [1, 2] },
    { input: [3, 3], target: 6, output: [0, 1] },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} should return #{test_case[:output]}" do
      expect(subject.two_sum(test_case[:input], test_case[:target])).to match_array(test_case[:output])
    end
  end
end
