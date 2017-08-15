require "json"
require "haml"
# server code itself


class FindServer < EventMachine::Connection
  def post_init
    start_tls(private_key_file: 'ldev.key', cert_chain_file: 'ldev.crt', verify_peer: false)
    #puts "-- someone connected!"
  end

  
  def receive_data data
    data_haml = self.class.render(data)
    if data_haml
      send_data data_haml
      return
    end
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
  def
  
  def self.render(data)

    if data =~ /GET (.*)/
      if file = File.open($1)
        page = file.read
        html = Haml::Engine.new(page)
        return html.render
      end
      
      return ""
    end
  end

  def unbind
    puts "-- they left"
  end
end
