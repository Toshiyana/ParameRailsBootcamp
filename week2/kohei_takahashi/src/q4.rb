class Character
  @@times = 0
  attr_accessor :hp, :initial_hp, :power, :mp, :color

  def initialize(hp, power, mp, color)
    @hp = hp
    @initial_hp = hp
    @power = power
    @mp = mp
    @color = color
  end

  def show_info
    puts "#{self.name} があらわれた！"
    self.class.description
    puts "----- INFO -----"
    puts "HP：#{@hp}"
    puts "MP：#{@mp}"
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

  def check_hp
    @@times += 1
    puts "#{@@times}ターン目"
    puts "#{self.name}の攻撃！"
    if @hp <= 0
      puts "#{self.name}はもう体力が残っていない！\n\n" 
      return false
    end
    return true
  end

  def attack(character)
    return unless check_hp
    character.hp -= @power
    puts "#{character.name}に\e[41m#{@power}ポイント\e[0mのダメージを与えた！"
    puts "#{character.name}のHPが#{character.hp+@power}->#{character.get_remaining_hp}になった！"
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
    super(90, 150, 0, 32)
    @suffix = suffix
    self.show_info
  end

  def name
    super(@@type + @suffix)
  end

  def attack_all(target_arr)
    puts "#{self.name}は\e[41m全体攻撃\e[0mをした！"
    puts 
    target_arr.each do |target|
      self.attack(target)
    end
  end

  def self.description
    puts "#{@@type}は、最弱のモンスターだ！"
  end
end

class FireSlime < Slime
  def initialize(suffix)
    super("\e[31m#{suffix}\e[0m")
  end

  def fire_attack(target)
    puts "#{self.name}は\e[41m特殊攻撃\e[0mをした！"
    puts 
    @power *= 3
    self.attack(target)
    @power /=3
  end

  def self.description
    super
    puts "炎属性スライムは強力な特殊攻撃を持っている！"
  end
end

class Hero < Character
  @@type = '主人公'

  def initialize
    super(1000, 30, 0, 34)
    self.show_info
  end

  def name
    super(@@type)
  end

  def attack(character)
    change_flage = false
    if [true, false, false, false, false].sample
      @power *=2
      change_flage = true
      puts "#{self.name}のパワーが一時的にアップした！"
      puts 
    end
    super(character)
    if change_flage
      @power /=2 
      puts "#{self.name}のパワーは通常に戻った！"
      puts 
    end
  end

  def self.description
    puts "#{@@type}は、この世界を守る勇者だ！"
  end
end

class Wizard < Character
  @@type = '魔法使い'
  attr_accessor :cure_power

  def initialize
    super(300, 10, 3, 35)
    @cure_power = 100
    self.show_info
  end

  def name
    super(@@type)
  end

  def cure(character)
    @@times += 1
    puts "#{@@times}ターン目"
    puts "#{self.name}の回復魔法！"
    return puts "しかし．#{self.name}にはもうMPが残っていない！\n\n" if @mp <= 0
    return puts "しかし．#{self.name}にはもう体力が残っていない！\n\n" if @hp <= 0
    return puts "残念！敵に回復魔法を使うことはできないよ！\n\n" if character.class == Slime
    return puts "しかし，既に#{character.name}のHPは全快だ！\n\n" if character.hp == character.initial_hp
    
    character.hp += @cure_power 
    @mp -= 1
    if character.hp > character.initial_hp
      character.hp = character.initial_hp
      puts "#{character.name}のHPが全快まで回復した"
    else
      puts "#{character.name}のHPを#{@cure_power}回復し、#{character.hp+@cure_power}->#{character.hp}になった"
    end
    puts "#{self.name}のMPが#{@mp+1}->#{@mp}になった！"
    puts 
  end

  def self.description
    puts "#{@@type}は、味方に回復魔法が使えるよ！"
  end
end

def get_target_arr(target_arr)
  return target_arr.reject { |target| target.hp <= 0}
end


puts "【ドラクエ風RPG】"
puts 

hero = Hero.new
slime_A = Slime.new('A')
fireslime_A = FireSlime.new('B')
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
    break if slime_A.hp <= 0 || slime_A.hp <= 0
      
    # スライムの攻撃
    if [true, false].sample
      target = get_target_arr([hero, wizard]).sample
      slime_A.attack(target)
    else
      slime_A.attack_all(get_target_arr([hero, wizard]))
    end
    break if hero.hp <= 0
    
    # 魔法使いの攻撃
    if [true, false].sample
      target = get_target_arr([hero, wizard, slime_A, fireslime_A]).sample
      wizard.cure(target)
    else
      target = get_target_arr([slime_A, fireslime_A]).sample
      wizard.attack(target)
    end
    break if slime_A.hp <= 0 || slime_A.hp <= 0

    # 炎スライムの攻撃
    if [true, false].sample
      target = get_target_arr([hero, wizard]).sample
      fireslime_A.attack(target)
    else
      target = get_target_arr([hero, wizard]).sample
      fireslime_A.fire_attack(target)
    end
    break if hero.hp <= 0
  else
    puts "----------"
    puts "  戦う"
    puts "▶︎ 逃げる"
    puts "----------"
    puts 

    if [true, false, false, false].sample
      puts "#{hero.name}は逃げ出せた！"
      break
    else
      puts "#{hero.name}は逃げ出せなかった！"
      puts
      target = get_target_arr([hero, wizard]).sample
      slime_A.attack(target)
      break if hero.hp <= 0
      target = get_target_arr([hero, wizard]).sample
      fireslime_A.attack(target)
      break if hero.hp <= 0
    end
  end
end

puts "#{hero.name}のHP：#{hero.get_remaining_hp}"
