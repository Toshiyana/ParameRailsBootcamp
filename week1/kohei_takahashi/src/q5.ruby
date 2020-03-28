# ---------------------------------------------------
# Q5. fruit_priceというハッシュを用意し，
# キーにそれぞれ「りんご」「ぶどう」「みかん」を，
# 値に100,200,300を追加してください．
# その後，キーと値をそれぞれ表示するプログラムを書いてください
# ---------------------------------------------------

puts "\nQ5\n\n"

def store_obj_in_hash(key, val, hash)
  puts "store {#{key}: #{val}} in hash"
  hash.store(key, val)
  puts "fruit_price = #{hash}"
end

def show_result(hash)
  puts "\nSHOW"
  hash.each do |key, val|
    puts "#{key}は#{val}円です"
  end
end

fruit_price = {}
store_obj_in_hash("りんご", 100, fruit_price)
store_obj_in_hash("ぶどう", 200, fruit_price)
store_obj_in_hash("みかん", 300, fruit_price)
show_result(fruit_price)



