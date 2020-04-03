return puts "これはq1.rbの説明用です"

class Character # Characterクラスを定義
  @@times = 0 # クラス変数を定義(ターン数を保持)
  attr_accessor :hp, :power, :color # インスタンス変数を定義(体力, 攻撃力, 文字色を保持)


  def initialize(hp, power, color) # イニシャライザ(コンストラクタ) インスタンスがnewされた時に呼ばれる
    @hp = hp # インスタンスがnewされた時の第一引数を体力を表すインスタンス変数@hpに代入
    @power = power # インスタンスがnewされた時の第二引数を攻撃力を表すインスタンス変数@powerに代入
    @color = color # インスタンスがnewされた時の第三引数を文字色を表すインスタンス変数@colorに代入
  end

  def show_info # メソッドを定義，これは情報を表示されるために作った
    puts "#{self.name} があらわれた！" # 出力
    self.class.description # クラスメソッドを実行，インスタンスからそのクラスを取得し，クラスごとのクラスメソッドを実行
    puts "----- INFO -----" # 出力
    puts "HP：#{@hp}" # 出力，体力
    puts "Power：#{@power}" # 出力，攻撃力
    puts "----------------" # 出力
    puts  # 出力，空行
  end

  def name(name) # メソッドを定義，オーバーライドされた子要素から呼ばれないと使えない
    "\e[#{@color}m#{name}\e[0m" # 文字色をキャラごとに変化させる
  end

  def get_remaining_hp # メソッドを定義，残りの体力を表示するように使う
    hp >= 0 ? hp : 0 # 体力が負にならないようにする
  end

  def attack(character) # メソッドを定義，攻撃する
    @@times += 1 # ターン数を1増やす
    puts "#{@@times}ターン目" # 出力，ターン数
    puts "#{self.name}の攻撃！" # 出力
    character.hp -= @power # 体力を攻撃された分だけ減らす
    puts "#{character.name}に\e[31m#{@power}ポイント\e[0mのダメージを与えた！" # 出力
    puts "#{character.name}のHPが#{character.get_remaining_hp}になった！" # 出力
    puts # 出力，空行

    if character.hp <= 0 # もし攻撃された方の体力が0以下になったら，倒したことになる
      self.defeat(character) # メソッドを実行, 攻撃された方を引数に取っている
    end
  end

  def defeat(character) # メソッドを定義，倒された時に使う
    puts "#{self.name}は#{character.name}を倒した！" # 出力
  end
end

class Slime < Character # Characterクラスを継承したSlimeクラスを定義
  @@type = 'スライム' # クラス変数を定義(統一の名前を保持)
  attr_accessor :suffix # インスタンス変数を定義(名前の後ろにつける文字を保持)

  def initialize(suffix) # イニシャライザ(コンストラクタ) インスタンスがnewされた時に呼ばれる
    super(90, 150, 32) # 親クラスのinitializeを継承して使っている
    @suffix = suffix # インスタンスがnewされた時の第一引数を名前の後ろにつける文字を表すインスタンス変数@suffixに代入
    self.show_info # 親クラスに定義しているshow_infoメソッドを実行
  end

  def name # メソッドを定義，Slimeインスタンスからnameメソッドが呼ばれると親クラスのnameではなくてオーバーライドされたこっちが呼ばれる
    super(@@type + @suffix) # 親クラスのnameメソッドからの戻り値がここの戻り値
  end

  def self.description # クラスメソッドを定義，Slime.descriptionで呼べる
    puts "#{@@type}は、最弱のモンスターだ！" # 出力
  end
end

class Hero < Character # Characterクラスを継承したHeroクラスを定義
  @@type = '主人公' # クラス変数を定義(統一の名前を保持)

  def initialize # イニシャライザ(コンストラクタ) インスタンスがnewされた時に呼ばれる
    super(1000, 30, 34) # 親クラスのinitializeを継承して使っている
    self.show_info # 親クラスに定義しているshow_infoメソッドを実行
  end

  def name # メソッドを定義，Heroインスタンスからnameメソッドが呼ばれると親クラスのnameではなくてオーバーライドされたこっちが呼ばれる
    super(@@type) # 親クラスのnameメソッドからの戻り値がここの戻り値
  end

  def self.description # クラスメソッドを定義，Slime.descriptionで呼べる
    puts "#{@@type}は、この世界を守る勇者だ！" # 出力
  end
end


puts "【ドラクエ風RPG】" # 出力
puts  # 出力，空行

hero = Hero.new # Heroクラスのインスタンスを生成
slime_A = Slime.new('A') # Slimeクラスのインスタンスを生成

# 戦闘開始
loop do # 戦いが終わるまでループする
  if [true, false].sample # 戦うのか逃げるのかをランダムで選ぶ(1:1)
    puts "----------" # 出力
    puts "▶︎ 戦う" # 出力
    puts "  逃げる" # 出力
    puts "----------" # 出力
    puts # 出力，空行

    hero.attack(slime_A) # ヒーローの攻撃
    if slime_A.hp <= 0 # スライムの体力が0以下になったら
      break # 戦い終了(loopを抜ける)
    end
    
    slime_A.attack(hero) # スライムの攻撃
    if hero.hp <= 0 # ヒーローの体力が0以下になったら
      break # 戦い終了(loopを抜ける)
    end
  else
    puts "----------" # 出力
    puts "  戦う" # 出力
    puts "▶︎ 逃げる" # 出力
    puts "----------" # 出力
    puts # 出力，空行

    if [true, false, false, false].sample # 逃げれるのか逃げきれないのかをランダムで選ぶ(1:3)
      puts "#{hero.name}は#{slime_A.name}から逃げ出せた！" # 出力
      break # 戦い終了(loopを抜ける)
    else
      puts "#{hero.name}は#{slime_A.name}から逃げ出せなかった！" # 出力
      puts # 出力，空行
      slime_A.attack(hero) # スライムの攻撃
      if hero.hp <= 0 # ヒーローの体力が0以下になったら
        break # 戦い終了(loopを抜ける)
      end
    end
  end
end

puts "#{hero.name}のHP：#{hero.get_remaining_hp}" # 最後にheroの体力を出力
