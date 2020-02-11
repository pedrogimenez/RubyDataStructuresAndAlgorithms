require_relative '../../../spec_helper'

describe DSA::Exercises::Search2DMatrix do
  test_cases = [
    {
      input: [
        [1, 3, 5, 7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
      ],
      target: 3,
      output: true
    },
    {
      input: [
        [1, 3, 5, 7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
      ],
      target: 13,
      output: false
    },
    {
      input: [],
      target: 0,
      output: false
    },
    {
      input: [[]],
      target: 1,
      output: false
    },
  ]

  test_cases.each do |test_case|
    it "#{test_case[:input]} with target #{test_case[:target]} should return #{test_case[:output]}" do
      expect(subject.search(test_case[:input], test_case[:target])).to eq(test_case[:output])
    end
  end
end
