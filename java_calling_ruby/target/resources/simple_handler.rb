class RubyHandler
  def receive(msg)
    puts "The rubies received Message: #{msg}"
  end
end
RubyHandler.new