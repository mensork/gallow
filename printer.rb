class Printer
  def initialize
    @images = []
    @counter = 0
    current_path = File.dirname(__FILE__)
    while @counter <= 7 do
    file_name = current_path + "/images/#{@counter}.txt"
       if File.exist?(file_name)
        f = File.new(file_name, "r:UTF-8")
        @images << f.readlines
        f.close
      else
        puts "   [ Файл не найден ]   \n\n"
      end
      @counter += 1
    end
  end

  def result(good_letters, letters)
    result = ""
    for item in letters
      if good_letters.include? item
        result += item + " "
      else
        result += "__ "
      end

    end
    result
  end

  def print_status(game)
    system "cls"
    puts "Слово: #{result(game.good_letters, game.letters)}"
    puts "Ошибки: #{game.bad_letters.join(", ")}"
    puts @images[game.errors] #если что не так, то в этом дело. сделать метод тогда

    if game.status == -1
      puts "Вы проиграли. Загаданное слово было #{game.letters.join("")}"
    elsif game.status == 1
      puts "Вы выиграли!"
    else
      puts "Осталось попыток: #{(7 - game.errors)}"
    end
  end
end