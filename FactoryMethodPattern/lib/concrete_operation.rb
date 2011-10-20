class AddOperation < Operation
  def calculate
    @nums.inject(0) { |mem, x| mem += x }
  end
end

class SubOperation < Operation
  def calculate
    @nums.inject(@nums[0] * 2) { |mem, x| mem -= x }
  end
end

class MulOperation < Operation
  def calculate
    @nums.inject(1) { |mem, x| mem *= x }
  end
end

class DivOperation < Operation
  def validate(args)
    raise(ZeroDivisionError, "Should not divide by zero") if args[1..-1].include?(0)
  end
  
  def calculate
    @nums.inject(@nums[0] ** 2) { |mem, x| mem /= x }
  end
end

class PowOperation < Operation
  def calculate
    @nums[1..-1].inject(@nums[0]) { |mem, x| mem ** x }
  end
end