class ResultPrinter
  def initialize
    @status_images = []
    counter = 0
    while counter <= 7
      file_path = __dir__ + "/images/#{counter}.txt"
      begin
        File.exist?(file_path)
        file = File.new(file_path,"r:UTF-8")
        @status_images << file.read
        file.close
      rescue
        @status_images << "\n [-----Picture not found-----] \n\n\n\n\n\n\n\n\n\n\n"
      end

      counter += 1
    end
  end

  def print_status(game)
    cls
    puts "\nWord: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Errors: #{game.errors}.   #{game.bad_letters.join(", ")}"
    print_gallow(game.errors)
    if game.status == -1
      puts "You lose. The word is : #{game.letters.join("")}"
    elsif game.status == 1
      puts "Congratulations! You won!"
    else
      puts "Remaining attempts: #{7-game.errors}"
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""
    letters.each do |item|
      if good_letters.include?(item)
        result += "#{item} "
      else
        result += "__ "
      end
    end
    result
  end

  def print_gallow(errors)
    puts @status_images[errors]
  end

  def cls
    system "cls"
  end
end