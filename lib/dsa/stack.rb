module DSA
  class Stack
    def initialize
      @stack = []
    end

    def push(item)
      @stack << item
    end

    def pop
      @stack.pop
    end

    def size
      @stack.size
    end
  end
end
