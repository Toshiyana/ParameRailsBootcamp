# ---------------------------------------------------
# Q4. scoreという配列を用意し，
# 100,200,300を追加してください．
# その後，その合計と平均を表示するプログラムを書いてください
# ---------------------------------------------------

puts "\nQ4\n\n"

def put_val_in_arr(val, arr)
  if val.nil?
    puts "score = #{arr}"
  else
    puts "put #{val} in score"
    arr.push(val)
    puts "score = #{arr}"
  end
end

def sum_vals_of_arr(arr)
  sum = 0
  arr.each do |val|
    sum += val
  end
  return sum
end

score = []
put_val_in_arr(nil, score)
put_val_in_arr(100, score)
put_val_in_arr(200, score)
put_val_in_arr(300, score)
puts "SUM：#{sum_vals_of_arr(score)}"
puts "AVERAGE：#{sum_vals_of_arr(score)/score.length}"




