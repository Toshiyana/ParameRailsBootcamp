# ---------------------------------------------------
# Q1. 変数num1を用意し,num1に好きな値を代入してください．
# その後，num1が2で割り切れた場合，「num1は偶数です」
# num1が2で割り切れなかった場合，「num1は奇数です」
# と表示するプログラムを書いてください
# ---------------------------------------------------

puts "\nQ1\n\n"

def result(num)
  if num%2 == 0
    puts "ANSWER: #{num}は偶数です"
  else
    puts "ANSWER: #{num}は奇数です"
  end
end

# 正しい入力が終わるまで繰り返す
loop do 
  print "0以上の整数で好きな値を入力してください："

  # キーボード入力された値をnum1に代入する
  num1 = gets.chomp

  # 整数かどうかの判定（ NG例: 05, 1aa, koko ）
  if num1 =~ /^[1-9][0-9]*$/
    result(num1.to_i)
    break
  else
    puts "ERROR: 0以上の整数を入力してください。\n\n"
  end
end 
