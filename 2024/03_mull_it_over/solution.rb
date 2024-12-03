result = 0
mul_enabled = true
pattern = /mul\((\d{1,3}),(\d{1,3})\)|(don't\(\)|do\(\))/

input = File.read("input.txt")

matches = input.scan(pattern)

for match in matches do
  if match.include? "do()"
    mul_enabled = true
  elsif match.include? "don't()"
    mul_enabled = false
  else
    if mul_enabled
      result += match[0].to_i * match[1].to_i
    end
  end
end

puts result