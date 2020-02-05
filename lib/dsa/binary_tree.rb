module DSA
  class BinaryTree
    attr_reader :root

    def initialize(value)
      @root = Node.new(value)
    end

    # Pre-order traversal (Deep first-search)
    def pre_order_print(start, traversal = "")
      return traversal unless start

      traversal += "#{start.value}-"
      traversal = pre_order_print(start.left, traversal)
      pre_order_print(start.right, traversal)
    end

    # In-order traversal (Deep-first search)
    def in_order_print(start, traversal = "")
      return traversal unless start

      traversal = in_order_print(start.left, traversal)
      traversal += "#{start.value}-"
      in_order_print(start.right, traversal)
    end

    # Post-order traversal (Deep-first search)
    def post_order_print(start, traversal = "")
      return traversal unless start

      traversal = post_order_print(start.left, traversal)
      traversal = post_order_print(start.right, traversal)
      traversal += "#{start.value}-"
    end

    # Level order traversal (Breadth-first search)
    def level_order_print(start, traversal = "")
      return traversal unless start

      queue = Queue.new
      queue << start

      while queue.size > 0 do
        node = queue.pop
        traversal += "#{node.value}-"
        queue << node.left if node.left
        queue << node.right if node.right
      end

      traversal
    end

    def reverse_level_order_print(start, traversal = "")
      return traversal unless start

      queue = Queue.new
      queue << start

      stack = []

      while queue.size > 0 do
        node = queue.pop
        stack << node

        queue << node.right if node.right
        queue << node.left if node.left
      end

      while node = stack.pop do
        traversal += "#{node.value}-"
      end

      traversal
    end
  end

  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value)
      @value = value
      @left  = nil
      @right = nil
    end
  end
end
