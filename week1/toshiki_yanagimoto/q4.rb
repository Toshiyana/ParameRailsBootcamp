scores = [100, 200, 300]
sum = 0

scores.each do |score|
    sum += score
end

puts "合計すると、#{sum}になります。"
puts "平均すると、#{sum/scores.length}になります。"