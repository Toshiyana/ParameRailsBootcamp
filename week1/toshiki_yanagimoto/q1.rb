puts "任意の整数を入力してください"
num1 = gets.chomp.to_i

if num1%2 == 1
    puts "#{num1}は奇数です"
else
    puts "#{num1}は偶数です"
end