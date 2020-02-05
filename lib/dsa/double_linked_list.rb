module DSA
  class DoubleLinkedList
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
    end

    # O(n)
    def remove(data)
      node = build_node(data)

      current_node = @head

      while current_node && current_node != node do
        current_node = current_node.next
      end

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
