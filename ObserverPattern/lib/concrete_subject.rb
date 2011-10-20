class Folk
  include Subjectable
  
  attr_reader :name, :addr
  
  def initialize(name, addr)
    super()
    @name = name
    @addr = addr
  end
  
  def move_in(new_addr)
    @addr = new_addr
    notification = []
    notification << "#{@name} is shouting: I've moved to #{@addr}!!!\n\n"
    notification.concat(notify)
    notification << "\nAll observers have been notified."
  end
end
