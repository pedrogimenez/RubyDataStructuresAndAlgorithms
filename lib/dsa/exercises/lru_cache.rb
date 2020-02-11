#
# LRU Cache
# https://leetcode.com/problems/lru-cache/
# Level: Medium
#
# Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
# 
# get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
# put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
# 
# The cache is initialized with a positive capacity.
#
# Solution O(1) - Leetcode: Passed (1836ms, 16 MB) - It's pretty slow.
#

module DSA
  module Exercises
    class LRUCache
      def initialize(capacity)
        @hash_table = {}
        @linked_list = DoubleLinkedList.new
        @capacity = capacity
      end

      # O(1)
      def put(key, value)
        if @hash_table.key?(key)
          node = move_to_end(key)
        else
          node = @linked_list.append(key)
        end

        @hash_table[key] = { value: value, node: node }

        evict if @hash_table.count > @capacity
      end

      # O(1)
      def get(key)
        result = @hash_table.fetch(key, -1)

        return result if result == -1

        move_to_end(key)

        result[:value]
      end

      private

      def evict
        head = @linked_list.head
        @hash_table.delete(head.data)
        @linked_list.remove_node(head)
      end

      def move_to_end(key)
        node = @hash_table[key][:node]
        @linked_list.move_to_end(node)
      end
    end
  end
end