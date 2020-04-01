#メソッドの定義
def caluculate_fruit_price(apple_price:,apple_quantity:,sum_price:)
#購入個数を合計金額／りんごの単価で計算
  apple_buy_quantity = sum_price / apple_price
#税込金額を計算、計算結果は四捨五入
  sum_price_inc_tax = (sum_price * 1.1).round
#残個数を計算
  remain_quantity = apple_quantity - apple_buy_quantity

#購入個数が割り切れない場合エラー、割り切れる場合は結果を出力
  if sum_price % apple_price  != 0
    puts "エラーがあります。計算できません。"
  else
    puts "税込価格は#{sum_price_inc_tax}円です。残りのりんごの個数は#{remain_quantity}です"
  end
end

#結果出力
caluculate_fruit_price(apple_price:100,apple_quantity:200,sum_price:2000)
