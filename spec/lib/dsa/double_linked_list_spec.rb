require_relative '../../spec_helper'

describe DSA::DoubleLinkedList do
  context 'append' do
    it 'appends an item to the list' do
      subject.append('a')
      subject.append('b')

      expect(subject.to_a).to eq(['a', 'b'])
    end
  end

  context 'remove' do
    it 'remove an item from the middle of the list' do
      subject.append('a')
      subject.append('b')
      subject.append('c')

      subject.remove('b')

      expect(subject.to_a).to eq(['a', 'c'])
    end

    it 'remove an item from the start of the list' do
      subject.append('a')
      subject.append('b')
      subject.append('c')

      subject.remove('a')

      expect(subject.to_a).to eq(['b', 'c'])
    end

    it 'remove an item from the end of the list' do
      subject.append('a')
      subject.append('b')
      subject.append('c')

      subject.remove('c')

      expect(subject.to_a).to eq(['a', 'b'])
    end
  end
end
