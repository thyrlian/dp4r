class CityHall
  include Observable
  
  attr_reader :loc
  
  def initialize(loc)
    @loc = loc
  end
  
  def update(subject)
    deregister(subject.name) + ",\n" + register(subject.name, subject.addr)
  end
  
  def register(name, addr)
    "  >>Rathaus #{@loc}: #{name} now registers to [#{addr}]"
  end
  
  def deregister(name)
    "  >>Rathaus #{@loc}: #{name}'s deregistration is done automatically"
  end
end

class Bank < Company
  include Observable
  
  def update(subject)
    update_client_addr(@name, subject)
  end
end

class HealthInsurance < Company
  include Observable
  
  def update(subject)
    update_client_addr(@name, subject)
  end
end

class ISP < Company
  include Observable
  
  def update(subject)
    update_client_addr(@name, subject) + ",\n" + enable_DSL(subject)
  end
  
  def enable_DSL(subject)
    "  >>#{@name}: [#{subject.addr}]'s DSL is now enabled"
  end
end

class OnlineStore < Company
  include Observable
  
  def update(subject)
    update_client_addr(@name, subject) + ",\n" + send_incentive_coupon(subject)
  end
  
  def send_incentive_coupon(subject)
    "  >>#{@name}: #{subject.name} will get an incentive coupon soon..."
  end
end

class Employer < Company
  include Observable
  
  def update(subject)
    update_client_addr(@name, subject)
  end
end

class Friend
  include Observable
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def update(subject)
    "  >>#{@name}: #{subject.name} has moved to [#{subject.addr}]" + ",\n" + suggest_a_party(subject.name)
  end
  
  def suggest_a_party(buddy)
    "  >>#{@name}: Hi #{buddy}, shall we have a party?"
  end
end
