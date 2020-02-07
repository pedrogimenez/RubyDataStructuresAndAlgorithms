#
# Two Sum
# https://leetcode.com/problems/two-sum/
# Level: Easy
#
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#

module DSA
  module Exercises
    class TwoSumProblem
      def two_sum(input, target)
        on(input, target)
      end

      private

      # O(n2) solution - Leetcode: Time Limit Exceeded (N/A, N/A)
      def on2(numbers, target)
        numbers.each_with_index do |number, index|
          numbers.each_with_index do |another_number, another_index|
            next if index == another_index

            return [index, another_index] if number + another_number == target
          end
        end
      end

      # O(n) solution - Leetcode: Passed (40ms, 10.2 MB)
      def on(numbers, target)
        hash_table = {}

        numbers.each_with_index do |number, index|
          hash_table[target-number] = index
        end

        numbers.each_with_index do |number, index_two|
          index_one = hash_table[number]

          return [index_one, index_two] if index_one && index_one != index_two
        end
      end

      # O(n) solution - Leetcode: Passed (28ms, 9.9 MB)
      def on_2(numbers, target)
        hash_table = {}

        numbers.each_with_index do |number, index|
          if index_two = hash_table[target - number]
            return [index, index_two]
          end

          hash_table[number] = index
        end
      end
    end
  end
end
