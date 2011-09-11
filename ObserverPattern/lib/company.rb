class Company
  attr_reader :name
  
  def initialize(name)
    @name = name
    @clients = []
  end
  
  def update_client_addr(me, client)
    "  >>#{me}: #{client.name}'s post address is updated to [#{client.addr}]"
  end
  
  def get_business(client)
    @clients.push(client)
  end
  
  def lose_business(client)
    @clients.delete(client)
  end
end
