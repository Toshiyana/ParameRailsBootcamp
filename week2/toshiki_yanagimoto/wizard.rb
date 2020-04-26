require "./character"

class Wizard < Character #Characterクラスを継承してSlimeクラスを作成
    @@type = "魔法使い" # クラス変数

    def initialize
        super(1000, 10) # characterのインスタンス変数hp.powerを継承
    end

    def name
        @@type # クラス変数を返す
    end

    def self.description # クラスメソッド
        puts @@type + "は、この世界を守る勇者だ!"
    end

    def cure(character) # 回復メソッド
        if character.hp == character.hp_max # 既にhpが全快の時
            puts "#{self.name}は、#{character.name}を回復しようとしたが、既に全快だった!"

        elsif character.hp < character.hp_max 
            character.hp += 100

            if character.hp >= character.hp_max # hpを全快まで回復する時
                character.hp = character.hp_max # hpが最初の上限を超えないように設定
                puts "#{self.name}は、#{character.name}のHPを全快まで回復した!"
            
            else # 通常時
                puts "#{self.name}は、#{character.name}のHPを100回復し、#{character.hp}になった!"
            end
        end
    end
end