require 'rails_helper'

RSpec.describe NumberConversion, type: :model do
  it "should convert numbers to binary" do
    expect(NumberConversion.new(input_number: 7, base: 2).result).to eq('111')
    expect(NumberConversion.new(input_number: 9, base: 2).result).to eq('1001')
    expect(NumberConversion.new(input_number: 89, base: 2).result).to eq('1011001')
    expect(NumberConversion.new(input_number: 8534, base: 2).result).to eq('10000101010110')
    expect(NumberConversion.new(input_number: 0, base: 2).result).to eq('0')
  end

  it "should convert numbers to base 3" do
    expect(NumberConversion.new(input_number: 7, base: 3).result).to eq('21')
    expect(NumberConversion.new(input_number: 9, base: 3).result).to eq('100')
    expect(NumberConversion.new(input_number: 89, base: 3).result).to eq('10022')
    expect(NumberConversion.new(input_number: 8534, base: 3).result).to eq('102201002')
    expect(NumberConversion.new(input_number: 0, base: 3).result).to eq('0')
    expect(NumberConversion.new(input_number: 1, base: 3).result).to eq('1')
    expect(NumberConversion.new(input_number: 2, base: 3).result).to eq('2')
    expect(NumberConversion.new(input_number: 3, base: 3).result).to eq('10')
    expect(NumberConversion.new(input_number: 4, base: 3).result).to eq('11')
    expect(NumberConversion.new(input_number: 5, base: 3).result).to eq('12')
    expect(NumberConversion.new(input_number: 6, base: 3).result).to eq('20')

    (0..1000).each do |n|
      actual = n.to_s(3)
      expect(NumberConversion.new(input_number: n, base: 3).result).to eq(actual)
    end
  end

  it "should convert numbers to hexadecimal" do
    expect(NumberConversion.new(input_number: 0, base: 16).result).to eq('0')
    expect(NumberConversion.new(input_number: 1, base: 16).result).to eq('1')
    expect(NumberConversion.new(input_number: 9, base: 16).result).to eq('9')
    expect(NumberConversion.new(input_number: 10, base: 16).result).to eq('a')
    expect(NumberConversion.new(input_number: 15, base: 16).result).to eq('f')
    expect(NumberConversion.new(input_number: 16, base: 16).result).to eq('10')
    expect(NumberConversion.new(input_number: 255, base: 16).result).to eq('ff')
    expect(NumberConversion.new(input_number: 256, base: 16).result).to eq('100')
    expect(NumberConversion.new(input_number: 8534, base: 16).result).to eq('2156')

    (0..1000).each do |n|
      actual = n.to_s(16)
      expect(NumberConversion.new(input_number: n, base: 16).result).to eq(actual)
    end
  end
end
