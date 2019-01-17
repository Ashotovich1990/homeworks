def sluggish_octopus(arr)
  result = arr[0].size

  (0...arr.size - 1).each do |i|
    (i+1...arr.size).each do |j|
      if arr[j].size > arr[i].size && arr.size[j] >= result
        result = arr[j]
      end
    end
  end
  result
end


def dominant_octopus(arr)
  sorted = false
  while !sorted
    sorted = true
    i = 0
    while i < arr.size -1
      if arr[i].size > arr[i+1].size
        arr[i], arr[i+1] = arr[i], arr[i+1]
        sorted = false
        break
      end
      i += 1
    end
  end
  arr[-1]
end

def clever_octopus(arr)
  result = arr[0]
  i = 1
  while i < arr.size
    if arr[i].size > result.size
      result = arr[i]
    end
    i += 1
  end
  result
end

def slow_dance(str,arr)
  arr.each_index {|i| return i if arr[i] == str}
  nil
end

MOVES = {"up" => 0, "right-up" =>1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7}
def constant_dance(str,arr)
  MOVES[str]
  # or arr.index(str)
end
