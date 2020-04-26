require "./slime"
require "./hero"
require "./wizard"

hero = Hero.new # heroインスタンスを生成
slime_A = Slime.new('A') # slime_Aインスタンスを生成
wizard = Wizard.new

loop do # どちらかの体力が尽きるまで無限ループ
    slime_A.attack(hero)
    hero.attack(slime_A)
    if slime_A.hp <= 0 || hero.hp <= 0
        break
    end
end

Hero.description
Slime.description