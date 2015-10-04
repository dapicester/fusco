class Fusco
  DIGITS  = '1234567890,.'
  LETTERS = 'FUSCONERIA.,'

  DIGITS_RE  = /\A[#{Regexp.escape DIGITS}]+\z/
  LETTERS_RE = /\A[#{Regexp.escape LETTERS}]+\z/i

  def encrypt(s)
    s.strip.chars.map do |c|
      i = DIGITS.index c
      fail ArgumentError, c if i.nil?
      LETTERS[i]
    end.join
  end

  def decrypt(s)
    s.strip.upcase.chars.map do |c|
      i = LETTERS.index c
      fail ArgumentError, c if i.nil?
      DIGITS[i]
    end.join
  end

  def go(s)
    case s
    when LETTERS_RE then decrypt(s)
    when DIGITS_RE  then encrypt(s)
    else fail ArgumentError, s
    end
  end
end
