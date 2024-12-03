def calc_distance(left_list, right_list)
  distance = 0

  left_list.each_with_index do |left, index|
    distance += (left.to_i - right_list[index].to_i).abs
  end

  distance
end

def calc_similarity(left_list, right_list)
  similarity = 0

  left_list.each do |item|
    similarity += item.to_i * right_list.count(item)
  end

  similarity
end

left_list = []
right_list = []

File.foreach("input.txt") do |line|
  arr = line.split('   ')
  left_list << arr[0]
  right_list << arr[1].strip
end

left_list.sort!
right_list.sort!

distance = calc_distance(left_list, right_list)
similarity = calc_similarity(left_list, right_list)

puts distance
puts similarity
