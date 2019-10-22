class Game
  MAX_ERRORS = 7
  attr_reader :status, :bad_letters, :good_letters, :errors, :letters
  attr_accessor :version
  def initialize(word)
    @letters = get_letters(word)
    @good_letters = []
    @bad_letters = []
    @errors = 0
    @status = :in_progress #:won, :lost
  end

  def get_letters(word)
    if word == nil || word == ""
      abort "Enter argument"
    else
      word.upcase.split("")
    end
  end

  def ask_next_letter
    puts "\nEnter a letter"
    letter = ""
    while letter == ""
      letter = STDIN.gets.encode("UTF-8").chomp
    end
    check_input(UnicodeUtils.upcase(letter))
  end

  def is_good?(letter)
    @letters.include?(letter) ||
      letter == 'Е' && @letters.include?('Ё') ||
      letter == 'Ё' && @letters.include?('Е') ||
      letter == 'И' && @letters.include?('Й') ||
      letter == 'Й' && @letters.include?('И')
  end

  def add_letter_to(letters, letter)
    letters << letter

    case letter
      when 'И' then letters << 'Й'
      when 'Й' then letters << 'И'
      when 'Е' then letters << 'Ё'
      when 'Ё' then letters << 'Е'
    end
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS- @errors
  end
  def solved?
    (@letters - @good_letters).empty?
  end

  def repeated?(letter)
    @bad_letters.include?(letter) || @good_letters.include?(letter)
  end

  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def check_input(letter)
    return if @status == :won || @status == :lost
    return if repeated?(letter)

    if is_good?(letter)
      add_letter_to(@good_letters, letter)
      @status = :won if solved?
    else
      add_letter_to(@bad_letters, letter)

      @errors += 1

      @status = :lost if lost?
    end
  end
end