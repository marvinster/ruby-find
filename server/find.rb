class FindServer < EventMachine::Connection
  def post_init
    puts "-- someone connected!"
  end
  def receive_data data
    send_data ">> you sent #{data}\n"
   send_data User.first.inspect.to_s + "\n"
    close_connection if data =~ /quit/i
  end
  def unbind
    puts "-- they left"
 end
end
