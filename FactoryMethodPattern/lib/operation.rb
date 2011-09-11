class Operation
  attr_accessor :op, :nums
  
  def initialize(*args)
    validate(args)
    @op = args.pop
    @nums = []
    @nums.push(*args)
  end
  
  class << self
    def input(*args)
      new(*args)
    end
  end
  
  def validate(args)
    # do nothing if no need for validation
  end
  
  def calculate
    raise "Abstract method is called: calculate"
  end
  
  private_class_method :new
  private :validate
end