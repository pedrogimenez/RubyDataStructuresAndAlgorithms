require_relative "../../../spec_helper"

describe DSA::Exercises::LRUCache do
  let(:subject) { described_class.new(2) }

  it "evicts the least recently used cached item" do
    subject.put(1, 1);
    subject.put(2, 2);
    subject.get(1);

    subject.put(3, 3);
    expect(subject.get(2)).to eq(-1)

    subject.put(4, 4);
    expect(subject.get(1)).to eq(-1)
  end

  it "updates the last usage of a cached item when putting it in the cache" do
    subject.put(2, 1)
    subject.put(1, 1)
    subject.put(2, 3)
    subject.put(4, 1)

    expect(subject.get(1)).to eq(-1)
    expect(subject.get(2)).to eq(3)
  end
end
