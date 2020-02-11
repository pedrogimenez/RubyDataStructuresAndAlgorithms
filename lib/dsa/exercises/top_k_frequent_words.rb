#
# Top K Frequent Words
# https://leetcode.com/problems/top-k-frequent-words/
# Level: Medium
#
# Given a non-empty list of words, return the k most frequent elements.
# 
# Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.
#
# Note:
#   You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
#   Input words contain only lowercase letters.
#

module DSA
  module Exercises
    class TopKFrequentWords
      def top_k_frequent(input, k)
        onlogn(input, k)
      end

      private

      # Solution O(n log n) - Leetcode: Passed (44ms, 9.4 MB)
      def onlogn(input, k)
        input.group_by(&:to_s).sort { |(word, values), (another_word, another_values)| [values.count, another_word] <=> [another_values.count, word] }.reverse.first(k).map(&:first)
      end
    end
  end
end
