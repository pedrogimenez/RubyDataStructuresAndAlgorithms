require_relative '../../spec_helper'

describe DSA::BinaryTree do
  context 'deep-first search' do
    it 'pre-order traversal' do
      tree = described_class.new('F')

      tree.root.left             = DSA::Node.new('B')
      tree.root.left.left        = DSA::Node.new('A')
      tree.root.left.right       = DSA::Node.new('D')
      tree.root.left.right.left  = DSA::Node.new('C')
      tree.root.left.right.right = DSA::Node.new('E')

      tree.root.right            = DSA::Node.new('G')
      tree.root.right.right      = DSA::Node.new('I')
      tree.root.right.right.left = DSA::Node.new('H')

      expect(tree.pre_order_print(tree.root)).to eq('F-B-A-D-C-E-G-I-H-')
    end

    it 'in-order traversal' do
      tree = described_class.new('F')

      tree.root.left             = DSA::Node.new('B')
      tree.root.left.left        = DSA::Node.new('A')
      tree.root.left.right       = DSA::Node.new('D')
      tree.root.left.right.left  = DSA::Node.new('C')
      tree.root.left.right.right = DSA::Node.new('E')

      tree.root.right            = DSA::Node.new('G')
      tree.root.right.right      = DSA::Node.new('I')
      tree.root.right.right.left = DSA::Node.new('H')

      expect(tree.in_order_print(tree.root)).to eq('A-B-C-D-E-F-G-H-I-')
    end

    it 'post-order traversal' do
      tree = described_class.new('F')

      tree.root.left             = DSA::Node.new('B')
      tree.root.left.left        = DSA::Node.new('A')
      tree.root.left.right       = DSA::Node.new('D')
      tree.root.left.right.left  = DSA::Node.new('C')
      tree.root.left.right.right = DSA::Node.new('E')

      tree.root.right            = DSA::Node.new('G')
      tree.root.right.right      = DSA::Node.new('I')
      tree.root.right.right.left = DSA::Node.new('H')

      expect(tree.post_order_print(tree.root)).to eq('A-C-E-D-B-H-I-G-F-')
    end
  end

  context 'breadth-first search' do
    it 'level-order traversal' do
      tree = described_class.new('F')

      tree.root.left             = DSA::Node.new('B')
      tree.root.left.left        = DSA::Node.new('A')
      tree.root.left.right       = DSA::Node.new('D')
      tree.root.left.right.left  = DSA::Node.new('C')
      tree.root.left.right.right = DSA::Node.new('E')

      tree.root.right            = DSA::Node.new('G')
      tree.root.right.right      = DSA::Node.new('I')
      tree.root.right.right.left = DSA::Node.new('H')

      expect(tree.level_order_print(tree.root)).to eq('F-B-G-A-D-I-C-E-H-')
    end

    it 'reverse level-order traversal' do
      tree = described_class.new('F')

      tree.root.left             = DSA::Node.new('B')
      tree.root.left.left        = DSA::Node.new('A')
      tree.root.left.right       = DSA::Node.new('D')
      tree.root.left.right.left  = DSA::Node.new('C')
      tree.root.left.right.right = DSA::Node.new('E')

      tree.root.right            = DSA::Node.new('G')
      tree.root.right.right      = DSA::Node.new('I')
      tree.root.right.right.left = DSA::Node.new('H')

      expect(tree.reverse_level_order_print(tree.root)).to eq('C-E-H-A-D-I-B-G-F-')
    end
  end
end
