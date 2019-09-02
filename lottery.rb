#сделать чтобы по стопу вылетало в выбор
def rsc_bot
[:камень,:ножницы,:бумагу][rand(0..2)]
end

def rnd_comment(money,m_money)
  comment = rand (1..5)
  if comment == 1
    puts "Повезёт в другой раз, списываю #{m_money}$.Осталось #{money}$."
    elsif comment == 2
      puts "Не расстраивайся! #{m_money}$ не так уж много.Осталось #{money}$."
    elsif comment == 3
      puts "Взял у тебя #{m_money}$. Сегодня остаешься без ужина.Осталось #{money}$."
    elsif comment == 4
      puts "#{m_money}$ - ТЕПЕРЬ МОИ! Студент? Ну не плачь, всего неделю поголодаешь.Осталось #{money}$."
    else
      puts "Минус #{m_money}$. Эти деньги пойдут на благотворительность!.Осталось #{money}$."
  end
end

def checker_limit_number(input,max_number)
	if input.to_i > max_number.to_i
		puts "Введите существующий вариант: от 1 до #{max_number}"
	else
		return true
	end
end

def game1(money)#добавить проверку на достаточное кол-во денег
print "Цена одного билета 2$ у вас #{money}$.Сколько раз будем играть:"
count_of_ticket = gets.chomp.strip.to_i
  money-=count_of_ticket*2
  puts "Куплено #{count_of_ticket} билетов, у вас осталось #{money}$"
  print "Сколько будет билетов:"
  count_all_ticket = gets.chomp.strip.to_i
	prize = count_all_ticket/3
  1.upto(count_of_ticket) do |i|
    puts "Играем #{i} раз шанс равен 1:#{(count_all_ticket.to_f/i.to_f).round(1)}"
    if i == rand(i..count_all_ticket)
      money+=prize
      puts "Вы выиграли #{prize}$, Ваш баланс #{money}$. Мои поздравления! Понадобилось всего #{i} попыток"
    end
  end
	return money
end

def game2(money)
  while true do
     puts "Жми enter, чтобы испытать удачу!"
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
                  money+=50
                  puts "Осталось #{money}$"
                end
              end
              7.upto(9) do |i|
                if  x == y &&  x == z &&  z == i
                  puts "Вам выпало #{x}-#{y}-#{z} Вы проиграли #{i*10}$"
                  money-=50
                  puts "Осталось #{money}$"
                end
              end
          else
            m_money= rand(1..5)
            money-=m_money
            rnd_comment(money,m_money)
          end
      end
  end
	return money
end

def game3(money)
  print "Привет! Загадываю число от 1 до "
  n=gets.chomp.strip.to_i
  if  n<=50
      price = 10
  elsif n>51 && n<=100	#придумать динамический алгоритм,чтобы вычислять стоимость игры
    price = 11 # исходя из 1..n по кол-ву попыток для ответа 50-5 100-7 +-
  end
  puts "Цена одной попытки #{price}$. Удачи!"
  number = rand(1..n)
	1.upto(n) do |i|
    puts "Я загадал число от 1 до #{n}, угадай какое. Попытка #{i}:"
    x = gets.chomp.strip.to_i
    if x == number
			money+=50
      puts "Ты угадал, число #{number}. Твой баланс:#{money}"
      break
    elsif x < number
			money-=price
		  puts "Нет,больше. Твой баланс:#{money}"
    elsif x > number
			money-=price
      puts "Нет,меньше. Твой баланс:#{money}"
    end
		break if money<10
  end
	return money
end

def game4(money)
	if money<=0
		puts "Вы банкрот:(\nСпасибо за игру:)"
		exit
		else
		arr = [:камень,:ножницы,:бумагу]
		while money>=1
			puts "1-камень, 2-ножницы,3-бумага"
			cmd=gets.chomp.strip.to_i
			user=arr[cmd-1]
			bot = rsc_bot
			puts "Вы выбрали #{user}"
			puts "Бот выбрал #{bot}"
			if user==bot
				puts "Draw. Ваш баланс:#{money}" #добавить стоимость игры для всех модулей
			elsif user ==:камень && bot==:ножницы
				money+=1
				puts "You win! Ножницы сломались об камень! Ваш баланс:#{money}"
			elsif user ==:камень && bot==:бумагу
				money-=1
				puts "You lose. Бумага накрыла камень. Ваш баланс:#{money}"
			elsif user ==:ножницы && bot==:камень
				money-=1
				puts "You lose. Ножницы сломались об камень. Ваш баланс:#{money}"
			elsif user ==:ножницы && bot==:бумагу
				money+=1
				puts "You win!Ножницы разрезали бумагу! Ваш баланс:#{money}"
			elsif user ==:бумагу  && bot==:камень
				money+=1
				puts "You win! Бумага накрыла камень! Ваш баланс:#{money}"
			elsif user ==:бумагу && bot==:ножницы
				money-=1
				puts "You lose. Ножницы разрезали бумагу. Ваш баланс:#{money}"
			end
			break if checker_limit_number(cmd,3) == false
		end
	end
	return money
end

def choose_game(money)
	while true do
	  puts "Во что будем играть ?"
	  puts "Лотерея-1"#сделать все цифры на одном уровне
	  puts "Однорукий-бандит - 2"
	  puts "Угадай число - 3"
	  puts "Камень Ножницы Бумага - 4"
	  choose = gets.chomp.strip.capitalize
	  if choose == "1"
	    game1(money)
	  end
	  if choose == "2"
	    game2(money)
	  end
	  if choose == "3"
	    game3(money)
	  end
	  if choose =="4"
	    game4(money)
		end
		break if checker_limit_number(choose,4) == false
	end
end

def check_confirm
  puts "Хотите сыграть ?"
  confirm = gets.chomp.strip.capitalize
  if confirm[0] == "Y" || confirm == "Д"
    puts "Сколько денег мне принесли ?"
    money=gets.chomp.strip.to_i
    choose_game(money)
  else
    puts "Ну и уходите!"
  end
end

puts "Сколько вам лет ?"
age = gets.chomp.strip.to_i
if age>=18
  check_confirm
else
  puts "Вы слишком молоды, подождите еще #{18-age} year(s)"
end
