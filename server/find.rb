require "json"
# server code itself


class FindServer < EventMachine::Connection
  def post_init
    start_tls(private_key_file: 'ldev.key', cert_chain_file: 'ldev.crt', verify_peer: false)
    #puts "-- someone connected!"
  end
  
  def receive_data data
    send_data ">> you sent #{data}\n"
    send_data User.first.inspect.to_s + "\n"
    begin
      b = JSON.parse(data)
      send_data "class: #{ b.class } \n #{b.inspect}\n"
    rescue Exception => e
      send_data "well there was an error:\n#{e}\n...\n"
    end
    close_connection if data =~ /quit/i
  end
  
  def unbind
    #puts "-- they left"
  end
end
