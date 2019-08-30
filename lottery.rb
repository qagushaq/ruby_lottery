def game
  puts "Сколько раз будем играть ?"
  count = gets.chomp.strip.to_i
  puts "Сколько будет билетов ?"
  rnd = gets.chomp.strip.to_i
  1.upto(count) do |i|
    puts "Играем #{i} раз шанс равен 1/#{(rnd/i).to_f}"
    if i == rand(i..rnd)
      puts "u win!! congrats! Понадобилось всего #{i} попыток"
    end
  end
end

def rnd_comment(money)
  comment = rand (1..4)
  if comment == 1
    puts "Повезёт в другой раз, списываю 5$.Осталось #{money}$."
    elsif comment == 2
      puts "Не расстраивайся! 5$ не так уж много.Осталось #{money}$."
    elsif comment == 3
      puts "Взял у тебя 5$. Сегодня остаешься без ужина.Осталось #{money}$."
    else
      puts "Минус 5$. Эти деньги пойдут на благотворительность!.Осталось #{money}.$"
  end
end

def game2
  money =100
  1000.times do
     #puts "Введите enter чтобы дернуть ручку"
    gets
    x=rand(0..9)
    y=rand(0..9)
    z=rand(0..9)
      if money<=0
        puts "Вы банкрот:(\nСпасибо за игру:)"
        exit
        else
          if x == y && x == z && x > 0 && x != 5
            puts " Вам выпало #{x}-#{y}-#{z} Вам зачислено #{x*10}$"
            money = money + x*10
            elsif x == 0 &&  y == 0 &&  z == 0
                puts "Вам выпало #{x}-#{y}-#{z} Вы все проиграли"
                money*=0
                puts "Осталось #{money}$"
            elsif x == y && x == z && x == 6
              puts "Jackpot!!! Ваш счёт удваивается!"
              money*=2
            elsif x == y || y == z
              puts "Парное совпадение! Вам зачислено 2$"
              money+=2
              puts "Осталось #{money}$"
                1.upto(5) do |i|
                if x == y &&  x == z &&  z == i
                  puts "Вам выпало #{x}-#{y}-#{z} Вам зачислено #{i*10}$"
                  money+=i*10
                  puts "Осталось #{money}$"
                end
              end
              7.upto(9) do |i|
                if  x == y &&  x == z &&  z == i
                  puts "Вам выпало #{x}-#{y}-#{z} Вы проиграли #{i*10}$"
                  money-=i*10
                  puts "Осталось #{money}$"
                end
              end
          else
            money-=5
            rnd_comment(money)
          end
      end
  end
end

def choose_game
  puts "Лотерея-1, однорукий-бандит - 2"
  choose = gets.chomp.strip.capitalize
  if choose == "1"
    game
  end
  if choose == "2"
    game2
  end
end

def check_confirm
  puts "Хотите сыграть ?"
  confirm = gets.chomp.strip.capitalize
  if confirm == "Y" || confirm == "Д"
    choose_game
  else
    puts "Ну и уходите!"
  end
end

puts "Сколько вам лет ?"
age = gets.chomp.strip.to_i
if age>=18
  check_confirm
else
  puts "Вы слишком молоды, подождите еще #{18-age} год"
end
