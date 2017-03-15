if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "game.rb"
require_relative "printer.rb"
require_relative "reader.rb"
require "unicode_utils/upcase"

system "cls"
puts "Игра Gallows. (\"Good Programmer\" course)"
sleep 0.5

printer = Printer.new
reader = Reader.new
game = Game.new(reader.word)

printer.print_status(game)
while game.status == 0 do
  game.get_letter
  printer.print_status(game)
end