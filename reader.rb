class Reader
  def word
    current_path = File.dirname(__FILE__)
    file_name = current_path + "/data/words.txt"
    if File.exist?(file_name)
      f = File.new(file_name, "r:UTF-8")
      word = f.readlines
      f.close
    else
      puts "Файл не найден"
    end
    word.sample.chomp
  end
end