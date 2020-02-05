#
# Contains duplicate
# https://leetcode.com/problems/contains-duplicate/
# Level: Easy
#
# Given an array of integers, find if the array contains any duplicates.
#
# Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
#

module DSA
  module Exercises
    class ContainsDuplicate
      def contains_duplicate?(input)
        on(input)
      end

      private

      # O(n2) solution - Leetcode: Time Limit Exceeded (N/A, N/A)
      def on2(numbers)
        numbers.each_with_index do |number, index|
          numbers.each_with_index do |another_number, another_index|
            next if index == another_index

            return true if number == another_number
          end
        end

        false
      end

      # O(2n) solution - Leetcode: Passed (48ms, 11.5 MB)
      def o2n(numbers)
        sorted_numbers = numbers.sort

        sorted_numbers.each_with_index do |number, index|
          return true if number == sorted_numbers[index + 1]
        end

        false
      end

      # O(n) solution - Leetcode: Passed (40 ms, 13.2 MB)
      def on(numbers)
        hash_table = {}

        numbers.each do |number|
          return true if hash_table.key?(number)
          hash_table[number] = nil
        end

        false
      end
    end
  end
end
