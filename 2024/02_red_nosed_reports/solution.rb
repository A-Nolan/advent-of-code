def safety_check(report)
  decreased = 0
  increased = 0
  bad_diff = false

  for i in 0..(report.count - 2) do
    diff = report[i] - report[i + 1]

    decreased += 1 if diff > 0
    increased += 1 if diff < 0
    bad_diff = true if diff.abs < 1 || diff.abs > 3
  end

  return 0 if decreased > 0 && increased > 0 || bad_diff

  1
end

def run_dampener(report)
  report.each_with_index do |num, index|
    report.delete_at(index)
    return 1 if safety_check(report) == 1
    report.insert(index, num)
  end

  0
end

reports = []
good_reports = 0

File.foreach("input.txt") do |line|
  arr = line.split(' ').map { |num| num.to_i }
  reports << arr
end

for report in reports do
  if safety_check(report) == 1
    good_reports += 1
  else
    good_reports += run_dampener(report)
  end
end

puts good_reports