require_relative '../../../spec_helper'

describe DSA::Exercises::TopKFrequentWords do
  test_cases = [
    { input: ["i", "love", "leetcode", "i", "love", "coding"], k: 2, output: ["i", "love"] },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} and k #{test_case[:k]} should return #{test_case[:output]}" do
      expect(subject.top_k_frequent(test_case[:input], test_case[:k])).to eq(test_case[:output])
    end
  end
end
