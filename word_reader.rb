class WordReader
  def read_from_file
    begin
      file_path = File.join(__dir__, 'data', 'words.txt')
      file = File.new(file_path, "r:UTF-8")
    rescue SystemCallError => error
      abort "FILE 'words.txt' NOT FOUND.\n" + error.message
    end
    f = file.readlines
    file.close
    f.sample.upcase.chomp
  end
end