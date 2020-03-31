#配列と計算用のsumを定義
score = [100,200,300]
sum = 0

#繰り返し処理で合計を計算
score.each do |num|
  sum +=num
end

#合計を配列の中身の数で割って平均値を計算
ave = sum / score.length

#出力
puts "合計値は#{sum}です"
puts "平均値は#{ave}です"
