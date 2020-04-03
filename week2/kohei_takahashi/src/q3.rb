class Character
  @@times = 0
  attr_accessor :hp, :initial_hp, :power, :color

  def initialize(hp, power, color)
    @hp = hp
    @initial_hp = hp
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
    puts if self.class != Hero
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

class Wizard < Character
  @@type = '魔法使い'
  attr_accessor :cure_power

  def initialize
    super(300, 10, 35)
    @cure_power = 100
    self.show_info
  end

  def name
    super(@@type)
  end

  def attack(character)
    if @hp <= 0
      @@times += 1
      puts "#{@@times}ターン目"
      puts "#{self.name}の攻撃！"
      puts "#{self.name}はもう体力が残っていない！\n\n" 
      return
    end
    super(character)
  end

  def cure(character)
    @@times += 1
    puts "#{@@times}ターン目"
    puts "#{self.name}の回復魔法！"
    return puts "しかし．#{self.name}にはもう体力が残っていない！\n\n" if @hp <= 0
    return puts "残念！敵に回復魔法を使うことはできないよ！\n\n" if character.class == Slime
    return puts "しかし，既に#{character.name}のhpは全快だ！\n\n" if character.hp == character.initial_hp
    
    character.hp += @cure_power  
    if character.hp > character.initial_hp
      character.hp = character.initial_hp
      puts "#{character.name}のhpが全快まで回復した\n\n"
    else
      puts "#{character.name}のHPを#{@cure_power}回復し、#{character.hp}になった\n\n"
    end
  end

  def self.description
    puts "#{@@type}は、味方に回復魔法が使えるよ！"
  end
end


puts "【ドラクエ風RPG】"
puts 

hero = Hero.new
slime_A = Slime.new('A')
wizard = Wizard.new

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
    target = [hero, wizard].sample
    slime_A.attack(target)
    if hero.hp <= 0
      break
    end
    
    # 魔法使いの攻撃
    if [true, false].sample
      target = [hero, wizard, slime_A].sample
      wizard.cure(target)
    else
      wizard.attack(slime_A)
    end
    if slime_A.hp <= 0
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
      target = [hero, wizard].sample
      slime_A.attack(target)
      if hero.hp <= 0
        break
      end
    end
  end
end

puts "#{hero.name}のHP：#{hero.get_remaining_hp}"
