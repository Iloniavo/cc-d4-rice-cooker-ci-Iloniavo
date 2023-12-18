require 'test/unit'
require_relative 'rice_cooker'


class TestRiceCooker < Test::Unit::TestCase
  def setup
    @rice_cooker = RiceCooker.new
  end

  def test_plug_unplug
    assert_equal(false, @rice_cooker.plugged_in)
    @rice_cooker.plug
    assert_equal(true, @rice_cooker.plugged_in)
    @rice_cooker.plug
    assert_equal(false, @rice_cooker.plugged_in)
  end

  def test_add_quantity
    assert_equal(0, @rice_cooker.quantity)
    @rice_cooker.add_quantity(500)
    assert_equal(500, @rice_cooker.quantity)
    @rice_cooker.add_quantity(3500)
    assert_equal(500, @rice_cooker.quantity)
  end

  def test_define_cook_time
    assert_equal(0, @rice_cooker.cook_time)
    @rice_cooker.define_cook_time(15)
    assert_equal(15, @rice_cooker.cook_time)
    @rice_cooker.define_cook_time(-5)
    assert_equal(15, @rice_cooker.cook_time)
  end

  def test_define_water_amount
    assert_equal(0, @rice_cooker.water_amount)
    @rice_cooker.define_water_amount(500)
    assert_equal(500, @rice_cooker.water_amount)
    @rice_cooker.define_water_amount(-200)
    assert_equal(500, @rice_cooker.water_amount)
  end

  def test_cook_rice
    # Mocking user inputs
    @rice_cooker.plug
    @rice_cooker.add_quantity(500)
    @rice_cooker.define_water_amount(500)
    @rice_cooker.define_cook_time(15)

    # Positive test case
    @rice_cooker.cook_rice
    assert_equal(true, @rice_cooker.is_used)

    # Negative test case
    @rice_cooker.is_used = false
    @rice_cooker.plugged_in = false
  end
end
