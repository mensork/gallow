class ResultPrinter
  def initialize(game)
    @status_images = []
    counter = 0
    while counter <= game.max_errors
      file_path = __dir__ + "/../images/#{counter}.txt"
      begin
        File.exist?(file_path)
        file = File.new(file_path, "r:UTF-8")
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
    puts game.version
    puts "\nWord: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Errors: #{game.errors}.   #{game.bad_letters.join(", ")}"
    print_gallows(game.errors)
    if game.lost?
      puts "You lose. The word is : #{game.letters.join("")}"
    elsif game.won?
      puts "Congratulations! You won!"
    else
      puts "Remaining attempts: #{game.errors_left}"
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

  def print_gallows(errors)
    puts @status_images[errors]
  end

  def cls
    system "cls"
  end
end