if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__)
require_relative current_path + "/lib/game.rb"
require_relative current_path + "/lib/result_printer.rb"
require_relative current_path + "/lib/word_reader.rb"
require "unicode_utils/upcase"

system "cls"
VERSION = "Gallow Game. Version 3.2. Classes, external files. Register control, exception Handling\n" \
 "'Good Programmer' course"
sleep 1

reader = WordReader.new
words_file_name = current_path + "/data/words.txt"
word = reader.read_from_file(words_file_name)
game = Game.new(word)
printer = ResultPrinter.new(game)

game.version = VERSION

printer.print_status(game)
while game.in_progress? do
  game.ask_next_letter
  printer.print_status(game)
end