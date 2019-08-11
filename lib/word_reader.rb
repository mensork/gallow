class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    begin
      lines = File.readlines(file_name, encoding: 'UTF-8')
    rescue SystemCallError => error
      abort "FILE '#{file_name}' NOT FOUND.\n" + error.message
    end
    lines.sample.chomp
  end
end