#
# Valid Parentheses
# https://leetcode.com/problems/valid-parentheses/
# Level: Easy
#
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# An input string is valid if:
#
# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
#
# Note that an empty string is also considered valid.
#

module DSA
  module Exercises
    class ValidParentheses
      def valid_parentheses?(input)
        on(input)
      end

      private

      # O(n) solution - Leetcode: Passed (36ms, 9.3 MB)
      def on(input)
        stack = Stack.new
        chars = input.chars.to_a

        chars.each do |char|
          if "({[".include?(char)
            stack.push(char)
          else
            opening = stack.pop

            return false unless valid_closing?(opening, char)
          end
        end

        stack.size == 0
      end

      def valid_closing?(opening, closing)
        opening == "(" && closing == ")" ||
          opening == "{" && closing == "}" ||
          opening == "[" && closing == "]"
      end
    end
  end
end
