require_relative '../../spec_helper'

describe DSA::LinkedList do
  context 'append' do
    it 'appends an item to the list' do
      linked_list = subject

      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')

      expect(linked_list.to_a).to eq(['a', 'b', 'c'])
    end

    it 'appends an item after a given node' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('d')

      linked_list.append_after_node('c', 'b')

      expect(linked_list.to_a).to eq(['a', 'b', 'c', 'd'])
    end

    it 'appends an item after a given node being the given node the second one' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')

      linked_list.append_after_node('c', 'b')

      expect(linked_list.to_a).to eq(['a', 'b', 'c'])
    end
  end

  context 'delete' do
    it 'deletes an item from the list' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')

      linked_list.delete('b')

      expect(linked_list.to_a).to eq(['a', 'c'])
    end

    it 'deletes an item from the list being the item the head' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')

      linked_list.delete('a')

      expect(linked_list.to_a).to eq(['b', 'c'])
    end

    it 'deletes an item from the list given a position' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')

      linked_list.delete_by_position(1)

      expect(linked_list.to_a).to eq(['a', 'c'])
    end

    it 'deletes an item from the list given a position being the position the head' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')

      linked_list.delete_by_position(0)

      expect(linked_list.to_a).to eq(['b', 'c', 'd'])
    end

    it 'deletes an item from the list given a position being the position the second one' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')

      linked_list.delete_by_position(2)

      expect(linked_list.to_a).to eq(['a', 'b', 'd'])
    end
  end

  context 'count' do
    it 'returns the item count' do
      linked_list = subject
      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')

      expect(linked_list.count).to eq(4)
    end

    it 'returns the item count when there is only one item' do
      linked_list = subject
      linked_list.append('a')

      expect(linked_list.count).to eq(1)
    end

    it 'returns the item count when there are zero items' do
      linked_list = subject

      expect(linked_list.count).to eq(0)
    end
  end

  context 'swap' do
    it 'swaps nodes' do
      linked_list = subject

      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')

      linked_list.swap_nodes('c', 'd')

      expect(linked_list.to_a).to eq(['a', 'b', 'd', 'c'])
    end

    it 'swaps nodes II' do
      linked_list = subject

      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')
      linked_list.append('e')

      linked_list.swap_nodes('c', 'e')

      expect(linked_list.to_a).to eq(['a', 'b', 'e', 'd', 'c'])
    end

    it 'swaps nodes III' do
      linked_list = subject

      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')
      linked_list.append('e')

      linked_list.swap_nodes('a', 'e')

      expect(linked_list.to_a).to eq(['e', 'b', 'c', 'd', 'a'])
    end

    it 'swaps nodes IV' do
      linked_list = subject

      linked_list.append('a')
      linked_list.append('b')
      linked_list.append('c')
      linked_list.append('d')
      linked_list.append('e')

      linked_list.swap_nodes('e', 'a')

      expect(linked_list.to_a).to eq(['e', 'b', 'c', 'd', 'a'])
    end
  end

  it 'prepends an item to the list' do
    linked_list = subject

    linked_list.prepend('a')
    linked_list.prepend('b')
    linked_list.prepend('c')

    expect(linked_list.to_a).to eq(['c', 'b', 'a'])
  end

  it 'reverses the list' do
    linked_list = subject

    linked_list.append('a')
    linked_list.append('b')
    linked_list.append('c')

    linked_list.reverse

    expect(linked_list.to_a).to eq(['c', 'b', 'a'])
  end
end
