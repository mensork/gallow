class WordReader
  def read_from_file(file_name)
    begin
      current_path = File.dirname(__FILE__)
      file_path = current_path + file_name
      file = File.new(file_path, "r:UTF-8")
    rescue SystemCallError => error
      abort "FILE 'words.txt' NOT FOUND.\n" + error.message
    end
    f = file.readlines
    file.close
    f.sample.upcase.chomp
  end
end