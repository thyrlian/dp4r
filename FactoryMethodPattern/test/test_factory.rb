require_relative 'test_helper'

class FactoryTest < Test::Unit::TestCase
  def test_add
    assert_equal(11, OperationFactory.build(1,2,8,"+").result)
  end
  
  def test_sub
    assert_equal(-10, OperationFactory.build(10,5,15,"-").result)
  end
  
  def test_mul
    assert_equal(3000, OperationFactory.build(5,6,100,"*").result)
  end
  
  def test_div
    assert_equal(3, OperationFactory.build(99,11,3,"/").result)
  end
  
  def test_pow
    assert_equal(6561, OperationFactory.build(3,4,2,"^").result)
  end
end
