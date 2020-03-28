# ---------------------------------------------------
# Q6. caluculate_fruit_price というメソッドを用意し、
# 引数をapple_price(りんごの値段), 
# apple_quantity(りんごの総個数),
# sum_price(買ったりんごの税別の合計金額)とし,
# 合計の税込金額と、残りのりんごの個数を表示してください。
# 更に合計金額がりんごの値段からありえない数値になる時は
# エラーメッセージを表示するメソッドを作って下さい。
# ---------------------------------------------------

puts "\nQ6\n\n"

def caluculate_fruit_price(apple_price, apple_quantity, sum_price)
  tax_rate = 0.1
  puts "\nりんご1つの値段(税別)：#{apple_price}個 りんごの総個数：#{apple_quantity}個 買ったりんごの合計金額(税別)：#{sum_price}個 の場合"
  # 購入したりんごの数(小数以下は切り捨てて割り切れているどうかに使う)
  purchased_apple_count = (sum_price / apple_price).floor
  # purchased_apple_countが割り切れていてかつ，総個数よりも少ない時
  if purchased_apple_count * apple_price == sum_price && apple_quantity >= purchased_apple_count
    # 小数第一位を四捨五入した税込み金額
    sum_price_in_tax = (sum_price + sum_price * tax_rate).round
    # 残りのりんごの個数
    remaining_apple_count = apple_quantity - sum_price / apple_price
    puts "税込み金額(四捨五入)は#{sum_price_in_tax}円で，残りりんごの個数は#{remaining_apple_count}個です"
  else
    puts "エラーがあります。計算できません。"
  end
end

puts "以下で3つの変数を設定してください"
print "りんご1つの値段(税別)："
apple_price = gets.chomp
print "りんごの総個数："
apple_quantity = gets.chomp
print "買ったりんごの合計金額(税別)："
sum_price = gets.chomp

caluculate_fruit_price(apple_price.to_i, apple_quantity.to_i, sum_price.to_i)
