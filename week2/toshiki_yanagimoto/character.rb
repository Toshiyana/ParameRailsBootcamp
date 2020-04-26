class Character
    attr_accessor :hp, :power, :hp_max # インスタンス変数を定義

    def initialize(hp, power) # インスタンス生成と同時に実行されるメソッド
        @hp = hp # インスタンス変数
        @power = power
        @hp_max = hp # hpの最大値
    end

    def name # このnameは使わない
        ""
    end

    def attack(character) # 攻撃メソッド
        character.hp -= @power # 攻撃するたび、characterのhpがpower分だけ減る
        puts "#{self.name}が#{character.name}を攻撃して#{@power}ポイントのダメージを与えた!"

        if character.hp <= 0 # characterのhpが0以下になったらdefeatメソッドを実行 
            self.defeat(character)
        end
    end

    def defeat(character) # characterのhpが0以下の時に実行
        puts "#{self.name}は#{character.name}を倒した!"
    end
end