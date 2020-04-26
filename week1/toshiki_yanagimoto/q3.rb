nums = [*1..30]

nums.each do |num|
    if num%3 == 0
        puts "#{num} は3の倍数です"
    else
        puts num
    end
end