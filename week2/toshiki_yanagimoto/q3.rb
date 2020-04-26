require "./slime"
require "./hero"
require "./wizard"

hero = Hero.new # heroインスタンスを生成
slime_A = Slime.new('A') # slime_Aインスタンスを生成
wizard = Wizard.new

puts "スライムが現れた!"
loop do # どちらかの体力が尽きるまで無限ループ
    puts "-------------------------------------"
    puts "各キャラクターの残りHP"
    puts "#{slime_A.name}: #{slime_A.hp}"
    puts "#{hero.name}: #{hero.hp}"
    puts "#{wizard.name}: #{wizard.hp}"
    puts "-------------------------------------"

    p = Random.rand # 確率pを定義し、50%の確率でhero, wizardを攻撃
    if p > 0.5
        slime_A.attack(hero)
    else
        slime_A.attack(wizard)
    end

    if slime_A.hp <= 0 || hero.hp <= 0
        break
    else
        hero.attack(slime_A)
    end

    if slime_A.hp <= 0 || hero.hp <= 0
        break
    else
        puts "-------------------------------------"
        puts "魔法使いの動きを番号で選択してください"
        puts "0. 攻撃"
        puts "1. 回復"
        puts "-------------------------------------"
        option1 = gets.chomp.to_i
        if option1 == 0
            wizard.attack(slime_A)
        else
            puts "---------------------------------"
            puts "誰を回復させるかを番号で選択してください"
            puts "0. 主人公"
            puts "1. 魔法使い自身"
            puts "---------------------------------"
            option2 = gets.chomp.to_i
            if option2 == 0
                wizard.cure(hero)
            else
                wizard.cure(wizard)
            end
        end
    end
end

# Hero.description
# Slime.description