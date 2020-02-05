#
# Best Time to Buy and Sell Stock
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# Level: Easy
#
# Say you have an array for which the ith element is the price of a given stock on day i.
#
# If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
#
# Note that you cannot sell a stock before you buy one.
#

module DSA
  module Exercises
    class BestTimeToBuyAndSellStock
      def get_maximum_profit(input)
        on_2(input)
      end

      private

      # O(n2) solution - Leetcode: Time Limit Exceeded (N/A, N/A)
      def on2(prices)
        max_profit = 0

        prices.each_with_index do |number, index|
          prices.each_with_index do |another_number, another_index|
            next if index >= another_index

            max_profit = [another_number - number, max_profit].max
          end
        end

        max_profit
      end

      # O(n) solution - Leetcode: Passed (480ms, 9.9 MB)
      def on(prices)
        max_profit = 0

        return max_profit if prices.empty?

        prices.each_with_index do |number, index|
          max_price_after_date = prices[index..-1].max

          next if max_price_after_date <= number

          max_profit = [max_price_after_date - number, max_profit].max
        end

        max_profit
      end

      # O(n) solution - Leetcode: Passed (32ms, 9.9 MB)
      def on_2(prices)
        max_profit = 0
        min_valley = prices.max

        prices.each do |number|
          if number < min_valley
            min_valley = number
          elsif number - min_valley > max_profit
            max_profit = number - min_valley
          end
        end

        max_profit
      end
    end
  end
end
