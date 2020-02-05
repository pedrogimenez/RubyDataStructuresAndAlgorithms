require_relative '../../../spec_helper'

describe DSA::Exercises::ValidAnagram do
  test_cases = [
    { input: ["anagram", "nagaram"], output: true },
    { input: ["rat", "car"], output: false },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} should return #{test_case[:output]}" do
      expect(subject.anagram?(*test_case[:input])).to eq(test_case[:output])
    end
  end
end
