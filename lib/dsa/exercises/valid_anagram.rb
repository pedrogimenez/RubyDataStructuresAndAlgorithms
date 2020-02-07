#
# Valid Anagram
# https://leetcode.com/problems/valid-anagram/
# Level: Easy
#
# Given two strings s and t , write a function to determine if t is an anagram of s.
#
# Note:
# You may assume the string contains only lowercase alphabets.
#

module DSA
  module Exercises
    class ValidAnagram
      def anagram?(word, another_word)
        onlogn(word, another_word)
      end

      private

      # O(n log n) solution - Leetcode: Passed (88ms, 19.8 MB)
      def onlogn(word, another_word)
        sorted_word         = word.chars.sort
        sorted_another_word = another_word.chars.sort

        sorted_word == sorted_another_word
      end

      # O(n) solution - Leetcode: Passed (100ms, 16.4 MB)
      def on(word, another_word)
        hash_table_one = word.chars.each_with_object({}) do |char, memo|
          memo[char] ||= 0
          memo[char] += 1
        end

        hash_table_two = another_word.chars.each_with_object({}) do |char, memo|
          memo[char] ||= 0
          memo[char] += 1
        end

        hash_table_one == hash_table_two
      end
    end
  end
end
