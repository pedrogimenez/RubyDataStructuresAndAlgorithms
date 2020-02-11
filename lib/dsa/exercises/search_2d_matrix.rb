#
# Search 2D Matrix
# https://leetcode.com/problems/search-a-2d-matrix/
# Level: Medium
#
# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
#
#   Integers in each row are sorted from left to right.
#   The first integer of each row is greater than the last integer of the previous row.
#

module DSA
  module Exercises
    class Search2DMatrix
      def search(input, target)
        onlogn(input, target)
      end

      private

      # O(n log n) solution - Leetcode: Passed (36ms, 9.9 MB)
      def onlogn(input, target, left = 0, right = nil)
        return false if input.empty? || input.first.empty?

        right = input.size * input.first.size - 1 unless right

        middle = (left + right) / 2

        row = middle / input.first.size
        col = middle % input.first.size

        value = input[row][col]

        if value == target
          true
        elsif left > right
          false
        elsif value > target
          onlogn(input, target, left, middle - 1)
        elsif value < target
          onlogn(input, target, middle + 1, right)
        end
      end

      # O(n log n) solution - Leetcode: Passed (36ms, 9.8 MB)
      def onlogn_2(input, target)
        return false if input.empty?

        correct_row = input.find do |row|
          next if row.empty?
          row.first <= target && row.last >= target
        end

        binary_search(correct_row, target)
      end

      # O(n) solution - Leetcode: Passed (36ms, 10.2 MB)
      def on(input, target)
        input.flatten.any? { |number| number == target }
      end

      def binary_search(row, target)
        return false unless row
        return row.first == target if row.size == 1

        size = row.size / 2
        left = row[0..size - 1]
        right = row[size..-1]

        if left.last >= target
          binary_search(left, target)
        elsif right.first <= target
          binary_search(right, target)
        else
          false
        end
      end
    end
  end
end
