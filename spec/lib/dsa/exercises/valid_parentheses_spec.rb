require_relative '../../../spec_helper'

describe DSA::Exercises::ValidParentheses do
  test_cases = [
    { input: "()", output: true },
    { input: "()[]{}", output: true },
    { input: "{[]}", output: true },
    { input: "(]", output: false },
    { input: "([)]", output: false },
    { input: "(", output: false },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} should return #{test_case[:output]}" do
      expect(subject.valid_parentheses?(test_case[:input])).to eq(test_case[:output])
    end
  end
end
