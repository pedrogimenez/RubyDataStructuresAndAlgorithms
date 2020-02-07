#
# Product of Array Except Self
# https://leetcode.com/problems/product-of-array-except-self/
# Level: Medium
#
# Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Note: Please solve it without division and in O(n).
#

module DSA
  module Exercises
    class ProductOfArrayExceptSelf
      def product(input)
        on(input)
      end

      private

      # O(n) solution - Leetcode: Passed (64 ms, 13.1 MB)
      def on(input)
        items = input.count - 1
        left  = []
        right = []

        left[0]      = 1
        right[items] = 1

        i = 1
        while i <= items do
          left[i] = left[i - 1] * input[i - 1]

          i += 1
        end

        i = items - 1
        while i >= 0 do
          right[i] = right[i + 1] * input[i + 1]

          i -= 1
        end

        (items + 1).times.map do |i|
          left[i] * right[i]
        end
      end

      # O(n2) solution - Leetcode: Time Limit Exceeded
      def on2(input)
        input.each_with_index.map do |_, index|
          get_product(input, index)
        end
      end

      # O(n2) solution - Leetcode: Passed (52ms, 13.1 MB)
      def on2_2(input)
        hash_table = {}

        input.each_with_index.map do |number, index|
          hash_table[number] ||= get_product(input, index)
        end
      end

      def get_product(input, index)
        input = input.dup
        input.delete_at(index)
        input.reduce(:*) # O(n)
      end
    end
  end
end
