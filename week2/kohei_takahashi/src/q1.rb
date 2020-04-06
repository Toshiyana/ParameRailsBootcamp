class Character
  @@times = 0
  attr_accessor :hp, :power, :color

  def initialize(hp, power, color)
    @hp = hp
    @power = power
    @color = color
  end

  def show_info
    puts "#{self.name} があらわれた！"
    self.class.description
    puts "----- INFO -----"
    puts "HP：#{@hp}"
    puts "Power：#{@power}"
    puts "----------------"
    puts 
  end

  def name(name)
    "\e[#{@color}m#{name}\e[0m"
  end

  def get_remaining_hp
    hp >= 0 ? hp : 0
  end

  def attack(character)
    @@times += 1
    puts "#{@@times}ターン目"
    puts "#{self.name}の攻撃！"
    character.hp -= @power
    puts "#{character.name}に\e[31m#{@power}ポイント\e[0mのダメージを与えた！"
    puts "#{character.name}のHPが#{character.get_remaining_hp}になった！"
    puts

    if character.hp <= 0
      self.defeat(character)
    end
  end

  def defeat(character)
    puts "#{self.name}は#{character.name}を倒した！"
  end
end

class Slime < Character
  @@type = 'スライム'
  attr_accessor :suffix

  def initialize(suffix)
    super(90, 150, 32)
    @suffix = suffix
    self.show_info
  end

  def name
    super(@@type + @suffix)
  end

  def self.description
    puts "#{@@type}は、最弱のモンスターだ！"
  end
end

class Hero < Character
  @@type = '主人公'

  def initialize
    super(1000, 30, 34)
    self.show_info
  end

  def name
    super(@@type)
  end

  def self.description
    puts "#{@@type}は、この世界を守る勇者だ！"
  end
end


puts "【ドラクエ風RPG】"
puts 

hero = Hero.new
slime_A = Slime.new('A')

# 戦闘開始
loop do 
  if [true, false].sample
    puts "----------"
    puts "▶︎ 戦う"
    puts "  逃げる"
    puts "----------"
    puts 

    # ヒーローの攻撃
    hero.attack(slime_A)
    if slime_A.hp <= 0
      break
    end
    
    # スライムの攻撃
    slime_A.attack(hero)
    if hero.hp <= 0
      break
    end
  else
    puts "----------"
    puts "  戦う"
    puts "▶︎ 逃げる"
    puts "----------"
    puts 

    if [true, false, false, false].sample
      puts "#{hero.name}は#{slime_A.name}から逃げ出せた！"
      break
    else
      puts "#{hero.name}は#{slime_A.name}から逃げ出せなかった！"
      puts
      slime_A.attack(hero)
      if hero.hp <= 0
        break
      end
    end
  end
end

puts "#{hero.name}のHP：#{hero.get_remaining_hp}"
