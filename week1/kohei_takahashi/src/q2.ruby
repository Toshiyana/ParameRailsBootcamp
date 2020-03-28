# ---------------------------------------------------
# Q2. Rubyで1〜100までの和を計算して、
# 回答を表示するプログラムを書いてください
# ---------------------------------------------------

puts "\nQ2\n\n"

def sleeeeep(max_time)
  remaining_times = max_time % 2 + 1
  for_times = max_time - remaining_times
  for_times.times do |time|
    if time == for_times / 2
      sleep 1
      print "計算中" 
      next
    end
    sleep 1
    print "，"
  end
  sleep remaining_times
end

def result_sum(first, last)
  sum = 0
  (first..last).each do |i|
    sum += i
  end
  return sum
end

puts "1〜100までの和を計算すると，，，"
sleeeeep(9)
puts "\nANSWER: #{result_sum(1, 100)}になります．"
