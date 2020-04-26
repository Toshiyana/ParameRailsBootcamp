require "./character"

class Hero < Character #Characterクラスを継承してSlimeクラスを作成
    @@type = "主人公" # クラス変数

    def initialize
        super(1000, 30) # characterのインスタンス変数hp.powerを継承
    end

    def name
        @@type # クラス変数を返す
    end

    def self.description # クラスメソッド
        puts @@type + "は、この世界を守る勇者だ!"
    end
end