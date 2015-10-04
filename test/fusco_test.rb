require 'test_helper'

class FuscoTest < Minitest::Test
  def setup
    @fusco = Fusco.new
  end

  def test_encrypt
    assert_equal 'FUSCONERIA', @fusco.encrypt(' 1234567890')
    assert_equal 'FUS.CONERIA', @fusco.encrypt('123,4567890 ')
    assert_equal 'FUSCONERI,A', @fusco.encrypt('123456789.0')

    assert_raises(ArgumentError) { @fusco.encrypt('a123456789.0') }
  end

  def test_decrypt
    assert_equal '1234,567890', @fusco.decrypt('fusc.oneria ')
    assert_equal '12.34567890', @fusco.decrypt(' FU,SCONERIA')
    assert_equal '1234567890', @fusco.decrypt('FusCONerIA')

    assert_raises(ArgumentError) { @fusco.decrypt('FusCONerIA2') }
  end

  def test_go
    assert 'FusCONe.rIA'.match Fusco::LETTERS_RE
    assert_equal '1234567,890', @fusco.go('FusCONe.rIA')

    assert '123,4567890'.match Fusco::DIGITS_RE
    assert_equal 'FUS.CONERIA', @fusco.go('123,4567890')

    assert_raises(ArgumentError) { @fusco.go 'f0obar2' }
  end
end
