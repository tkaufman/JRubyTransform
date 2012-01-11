class LoadPathOutputter
  def afterPropertiesSet()
    puts "Ruby Path is #{$:.join(';')}"
  end
end

LoadPathOutputter.new