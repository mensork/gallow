class Game
  def initialize(slovo)
    @letters = UnicodeUtils.upcase(slovo).split("")
    @good_letters = []
    @bad_letters = []
    @errors = 0
    @status = 0
  end

  def get_letter
    letter = ""
    while letter == ""
      letter = STDIN.gets.chomp
    end
    check_letter(UnicodeUtils.upcase(letter))
  end

  def check_letter(bukva)
    if status == 1 || status == -1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if (bukva == "е" && @letters.include?("ё")) ||
       (bukva == "ё" && @letters.include?("е"))
      @good_letters << "е" << "ё"
    elsif @letters.include?(bukva)
      @good_letters << bukva
    else
      @bad_letters << bukva
      @errors +=1
    end

    if @errors >= 7
      @status = -1
    end

    if (@letters - @good_letters).empty?
      @status = 1
    end
  end

  def status
    @status
  end

  def errors
    @errors
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def letters
    @letters
  end
end