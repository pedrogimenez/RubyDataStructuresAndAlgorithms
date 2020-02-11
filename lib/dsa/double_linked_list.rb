module DSA
  class DoubleLinkedList
    attr_reader :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    # O(1)
    def append(data)
      node = build_node(data)

      if @head.nil?
        @head = node
        @tail = node
      else
        node.prev = @tail
        @tail&.next = node
        @tail = node
      end

      node
    end

    # O(1)
    def append_node(node)
      if @head.nil?
        @head = node
        @tail = node
      else
        node.prev = @tail
        @tail&.next = node
        @tail = node
      end

      node
    end

    # O(1)
    def remove_node(node)
      current_node = node

      if current_node.prev
        current_node.prev.next = current_node.next
      else
        @head = current_node.next
      end

      if current_node.next
        current_node.next.prev = current_node.prev
      else
        @tail = current_node.prev
      end

      current_node
    end

    # O(n)
    def remove(data)
      node = build_node(data)

      current_node = @head

      while current_node && current_node != node do
        current_node = current_node.next
      end

      remove_node(current_node)
    end

    def move_to_end(node)
      return node if node == @tail
      remove_node(node)
      append_node(node)
    end

    def to_a
      current_node = @head

      nodes = []

      while current_node do
        nodes << current_node.data
        current_node = current_node.next
      end

      nodes
    end

    private

    def build_node(data)
      DoubleLinkedListNode.new(data)
    end
  end

  class DoubleLinkedListNode
    attr_accessor :prev, :next
    attr_reader :data

    def initialize(data)
      @data = data
      @prev = nil
      @next = nil
    end

    def ==(another_node)
      data == another_node.data
    end
  end
end
