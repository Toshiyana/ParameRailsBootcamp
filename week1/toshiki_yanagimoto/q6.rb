def calculate_fruit_price(apple_price, apple_quantity, sum_price)
    price_tax = (sum_price * 1.1).to_i
    apple_num = sum_price / apple_price
    apple_left = apple_quantity - apple_num
    if sum_price % apple_price ==0
        return puts "税込み金額は#{price_tax}円で、残りのリンゴの個数は#{apple_left}個です"
    else
        return puts "エラーがあります。計算できません。"
    end
end

calculate_fruit_price(100, 200, 1000)