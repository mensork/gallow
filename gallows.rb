if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "game.rb"
require_relative "result_printer.rb"
require_relative "word_reader.rb"
require "unicode_utils/upcase"

system "cls"
puts "Gallow Game. Version 3.2. Classes, external files. Register control, exception Handling\n" \
 "'Good Programmer' course"
sleep 1

printer = ResultPrinter.new
reader = WordReader.new
game = Game.new(reader.read_from_file)

printer.print_status(game)
while game.status == 0 do
  game.ask_next_letter
  printer.print_status(game)
end