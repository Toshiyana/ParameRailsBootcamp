#startとendの値を定義する
num_start = 1
num_end = 30

#繰り返し処理を行う
(num_start..num_end).each do |n|
  if n %3 == 0
    puts "#{n} は3の倍数です"
  else
    puts n
  end
end
