class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    begin
      file = File.new(file_name, "r:UTF-8")
    rescue SystemCallError => error
      abort "FILE '#{file_name}' NOT FOUND.\n" + error.message
    end
    f = file.readlines
    file.close
    f.sample.upcase.chomp
  end
end