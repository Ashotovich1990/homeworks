class Stack
  def initialize
    @stack = Array.new
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key,value)
    if @map.any? {|el| el[0] == key}
      puts "The Key exists. Do you want to overwrite it?: Y/N"
      response = gets.chomp.upcase
      if response == "Y"
         @map.select {|el| el[0] == key}[0] = [key,value]
      end
    else
      @map << [key,value]
    end
  end

  def get(key)
    if @map.none? {|el| el[0] == key}
      puts "No Key found"
    else
      "#{@map.select {|el| el[0] == key}[0][0]} => #{@map.select {|el| el[0] == key}[0][1]}"
    end
  end

  def delete(key)
    @map.reject! {|el| el[0] == key}
  end

  def show
  puts (@map.map do |el|
       "#{el[0]} => #{el[1]}"
    end)
  end
end
