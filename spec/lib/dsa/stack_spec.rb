require_relative '../../spec_helper'

describe DSA::Stack do
  it 'pushes an item to the top of the stack' do
    stack = subject

    stack.push('a')

    expect(stack.size).to eq(1)
    expect(stack.pop).to eq('a')
  end

  it 'pops an item from the top of the stack' do
    stack = subject

    stack.push('a')
    item = stack.pop

    expect(item).to eq('a')
    expect(stack.size).to eq(0)
  end

  it 'reverses an string' do
    str = 'Hello'

    stack = subject
    str.split('').each { |letter| stack.push(letter) }

    new_str = ""
    while stack.size > 0 do
      new_str += stack.pop
    end

    expect(new_str).to eq('olleH')
  end
end
