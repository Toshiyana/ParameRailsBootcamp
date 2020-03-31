#startとendの値を定義する
num_start = 1
num_end = 100

#繰り返し計算用にsumを定義する
sum = 0

#繰り返し処理を行う
(num_start..num_end).each do |n|
  sum += n
end

#出力する
puts "#{num_start}~#{num_end}までの和を計算すると,#{sum}になります"
