class Terminal
  def setPricing(pricing)
    @pricing = pricing
  end

  def reset
    @cart = {}
    @pricing.each_key { |c| @cart[c] = {:count => 0, :price => 0.00} }
    @total = 0.00
  end

  def scan(code)
    product = @pricing[code=code.to_sym]
    unit_price = product[:unit_price]
    count = @cart[code][:count] += 1

    if (volume=product[:volume]).nil?
      @cart[code][:price] += unit_price
      @total += unit_price
    else
      @total -= @cart[code][:price]
      @cart[code][:price] = (count / volume[:count]) * volume[:price]
      @cart[code][:price] += (count % volume[:count]) * unit_price
      @total += @cart[code][:price]
    end
  end

  def test(sequence, expected)
    reset
    puts "\nScan these items in this order: #{sequence}."
    sequence.each_char { |c| scan c }
    puts "The total price is: $#{sprintf('%.2f', @total)}."
    puts @total == expected ?
        "Correct!" : "Incorrect! Got: $#{@total}. Expected: $#{expected}."
  end
end
