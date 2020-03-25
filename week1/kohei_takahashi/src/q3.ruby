# ---------------------------------------------------
# Q3. 1〜30までの数字を順番に表示し，
# もしも3の倍数だったら「3の倍数です」
# と表示するプログラムを書いてください
# ---------------------------------------------------

puts "\nQ3\n\n"

def show_n_double(first, last, n)
  puts "#{first}〜#{last}を表示しつつ，#{n}の倍数を伝える"
  (first..last).each do |num|
    if num % n == 0
      puts "#{num} は#{n}の倍数です"
    else
      puts num
    end
  end
end

show_n_double(1, 30, 3)



