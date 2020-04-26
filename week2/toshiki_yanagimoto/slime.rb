require "./character"

class Slime < Character #Characterクラスを継承してSlimeクラスを作成
    @@type = "スライム" # クラス変数

    attr_accessor :suffix # スライムAなどの'A'

    def initialize(suffix)
        super(90, 150) # characterのインスタンス変数hp.powerを継承
        @suffix = suffix
    end

    def name
        @@type + @suffix # ex) スライムAのように返す
    end

    def self.description # クラスメソッド
        puts @@type + "は、最強のモンスターだ!"
    end
end