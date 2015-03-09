class Bottles

  def template(num)
    "#{bottle_text(num, true)} of beer on the wall, #{bottle_text(num)} of beer.\n#{take_text(num)}, #{bottle_text(num -1)} of beer on the wall.\n"
  end

  def bottle_text(num, capitalise = false)
    if num == 0 && !capitalise
      'no more bottles'
    elsif num == 0 && capitalise
      'No more bottles'
    else
      num = num >= 1 ? num : 99
      num > 1 ? "#{num} bottles" : "#{num} bottle"
    end
  end
  
  def take_text(num)
    if num == 0
      'Go to the store and buy some more'
    else
      num == 1 ? "Take it down and pass it around" : "Take one down and pass it around"
    end
  end

  def verse(num)
    template(num)
  end

  def verses(*num)
    range = (num.first..num.last).to_a
    puts range
    range.reduce('') do |all_verses,n|
      all_verses += verse(n) + "\n"
    end
  end

end
