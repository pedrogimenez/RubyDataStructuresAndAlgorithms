module DSA
  class LinkedListNode
    attr_reader :data, :next
    attr_writer :next

    def initialize(data)
      @data = data
      @next = nil
    end

    def ==(another_node)
      @data == another_node.data
    end
  end

  class LinkedList
    attr_reader :head

    def initialize
      @head = nil
    end

    def to_a
      array = []

      last_node = @head
      while last_node.next do
        array << last_node.data
        last_node = last_node.next
      end

      array << last_node.data

      array
    end

    def count
      recursive_count(@head)
    end

    def append(data)
      node = build_node(data)

      if @head.nil?
        @head = node
        return
      end

      last_node = fetch_last_node
      last_node.next = node
    end

    def append_after_node(data, after)
      node = build_node(data)
      after = build_node(after)

      after = find_node(after)
      node.next = after.next
      after.next = node
    end

    def prepend(data)
      node = build_node(data)

      node.next = @head
      @head = node
    end

    def delete(data)
      node = build_node(data)

      previous_node = find_previous_node(node)

      if previous_node.nil?
        @head = @head.next
        return
      end

      node = find_node(node)

      previous_node.next = node.next
    end

    def delete_by_position(position)
      current_node = @head

      if position == 0
        @head = current_node.next
        return
      end

      i = 0
      while current_node.next && i + 1 != position
        current_node = current_node.next
        i += 1
      end

      current_node.next = current_node.next.next
    end

    def swap_nodes(node, another_node)
      previous_to_node = find_previous_node(build_node(node))
      current_node = previous_to_node&.next || @head

      previous_to_another_node = find_previous_node(build_node(another_node))
      current_another_node = previous_to_another_node&.next || @head

      if previous_to_node
        previous_to_node.next = current_another_node
      else
        @head = current_another_node
      end

      if previous_to_another_node
        previous_to_another_node.next = current_node
      else
        @head = current_node
      end

      current_node.next, current_another_node.next = [current_another_node.next, current_node.next]
    end

    def reverse
      current_node = @head
      previous_node = nil

      while current_node do
        next_node = current_node.next
        current_node.next = previous_node
        previous_node = current_node
        current_node = next_node
      end

      @head = previous_node
    end

    private

    def fetch_last_node
      last_node = @head

      while last_node.next do
        last_node = last_node.next
      end

      last_node
    end

    def find_node(node)
      last_node = @head

      while last_node.next && last_node != node do
        last_node = last_node.next
      end

      last_node
    end

    def find_previous_node(node)
      last_node = @head

      return nil if @head == node

      while last_node.next && last_node.next != node do
        last_node = last_node.next
      end

      last_node
    end

    def recursive_count(node)
      return 0 if node.nil?
      1 + recursive_count(node.next)
    end

    def build_node(data)
      LinkedListNode.new(data)
    end
  end
end
