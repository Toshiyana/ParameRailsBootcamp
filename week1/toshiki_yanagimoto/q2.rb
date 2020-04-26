nums = [*1..100]
sum = 0

nums.each do |num|
    sum += num
end

puts "1~100までの和を計算すると、#{sum}になります。"