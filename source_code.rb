File.open $0, 'r' do |f|
  f.readlines.each do |line|
    puts line.chomp
  end
end
