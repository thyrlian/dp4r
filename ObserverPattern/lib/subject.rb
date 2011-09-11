# Using inheritance can cause grief, since Ruby allows only one superclass for each class
# If it demands another appropriate inheritance, whilst the only superclass is used up
# Thus, here module is more preferable than class
module Subjectable
  attr_reader :observers
  
  def initialize()
    @observers = []
  end
  
  def attach(*observers)
    @observers.push(*observers)
    observers.each do |observer|
      observer.get_business(self) if observer.respond_to?(:get_business)
    end
  end
  
  def detach(*observers)
    observers.each do |observer|
      @observers.delete(observer)
      observer.lose_business(self) if observer.respond_to?(:lose_business)
    end
  end
  
  def notify
    msgs = @observers.inject([]) do |msgs, observer|
      msgs << observer.update(self)
    end
  end
end
