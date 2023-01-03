#require 'pry-byebug'
module Enumerable
  # Your code goes here

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return unless block_given?
    for element in self do
      yield element
    end
  end

  def my_each_with_index
    return unless block_given?
    index = 0
    for el in self do
      yield el, index
      index += 1
    end
  end

  def my_select
    return unless block_given?
    results = []
    self.my_each do |i|
      if yield i
        results << i
      end
    end
    results
  end

  def my_all?
    return unless block_given?
    self.my_each do |i|
      return false if not yield i
    end
    return true
  end

  def my_any?
    return unless block_given?
    self.my_each do |i|
      return true if yield i
    end
    return false
  end

  def my_none?
    return unless block_given?
    self.my_each do |i|
      return false if yield i
    end
    return true
  end

  def my_count
    if block_given? then
      count = 0
      self.my_each do |i|
        if yield i
          count += 1
        end
      end
      count
    else
      self.length
    end
  end

  def my_map
    return unless block_given?
    results = []
    self.my_each do |i|
      results.push(yield i)
    end
    results
  end

end

test_arr = [1,-2,33,4,50]
p test_arr.my_map { |i| i * 2}









