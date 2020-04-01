#ハッシュを定義
fruit_price = {
  "りんご":100,
  "ぶどう":200,
  "みかん":300
}

#繰り返し処理で出力する
fruit_price.each do |key,value|
  puts "#{key}は#{value}円です"
end
