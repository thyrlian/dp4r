require_relative 'test_helper'

class SubjectTest < Test::Unit::TestCase
  def setup
    @ppl = Folk.new("Baccus", "Popitzweg, Berlin")
    @rathaus_ste = CityHall.new("Steglitz")
    @bank_db = Bank.new("Deutsche Bank")
    @insurance_aok = HealthInsurance.new("AOK")
    @isp_alice = ISP.new("Alice DSL")
    @b2c_amazon = OnlineStore.new("Amazon")
    @employer_sap = Employer.new("SAP")
    @freundin_s = Friend.new("Sarah")
    @freundin_b = Friend.new("Bettina")
  end
  
  def test_attach
    @ppl.attach(@rathaus_ste, @bank_db, @insurance_aok, @isp_alice, @b2c_amazon, @employer_sap, @freundin_s, @freundin_b)
    assert_equal(8, @ppl.observers.size)
    assert_equal(["CityHall", "Bank", "HealthInsurance", "ISP", "OnlineStore", "Employer", "Friend"].sort, 
                 @ppl.observers.inject([]){|mem,observer| mem.push(observer.class.to_s)}.uniq.sort)
  end
  
  def test_detach
    @ppl.attach(@rathaus_ste, @bank_db, @insurance_aok, @isp_alice, @b2c_amazon, @employer_sap, @freundin_s, @freundin_b)
    @ppl.detach(@employer_sap)
    assert_equal(7, @ppl.observers.size)
    assert_equal(["CityHall", "Bank", "HealthInsurance", "ISP", "OnlineStore", "Friend"].sort, 
                 @ppl.observers.inject([]){|mem,observer| mem.push(observer.class.to_s)}.uniq.sort)
  end
  
  def test_notify
    @ppl.attach(@rathaus_ste, @bank_db, @insurance_aok, @isp_alice, @b2c_amazon, @employer_sap, @freundin_s, @freundin_b)
    notification = @ppl.move_in("Steglitz, Berlin")
    assert_equal("Baccus is shouting: I've moved to Steglitz, Berlin!!!\n\n", notification[0])
    assert_equal("  >>Rathaus Steglitz: Baccus's deregistration is done automatically,\n  >>Rathaus Steglitz: Baccus now registers to [Steglitz, Berlin]", notification[1])
    assert_equal("  >>Deutsche Bank: Baccus's post address is updated to [Steglitz, Berlin]", notification[2])
    assert_equal("  >>AOK: Baccus's post address is updated to [Steglitz, Berlin]", notification[3])
    assert_equal("  >>Alice DSL: Baccus's post address is updated to [Steglitz, Berlin],\n  >>Alice DSL: [Steglitz, Berlin]'s DSL is now enabled", notification[4])
    assert_equal("  >>Amazon: Baccus's post address is updated to [Steglitz, Berlin],\n  >>Amazon: Baccus will get an incentive coupon soon...", notification[5])
    assert_equal("  >>SAP: Baccus's post address is updated to [Steglitz, Berlin]", notification[6])
    assert_equal("  >>Sarah: Baccus has moved to [Steglitz, Berlin],\n  >>Sarah: Hi Baccus, shall we have a party?", notification[7])
    assert_equal("  >>Bettina: Baccus has moved to [Steglitz, Berlin],\n  >>Bettina: Hi Baccus, shall we have a party?", notification[8])
    assert_equal("\nAll observers have been notified.", notification[9])
  end
end
