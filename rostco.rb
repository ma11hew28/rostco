require 'terminal.rb'

terminal = Terminal.new
terminal.setPricing({
  :A => {:unit_price => 2.00, :volume => {:count => 4, :price => 7.00}},
  :B => {:unit_price => 12.00},
  :C => {:unit_price => 1.25, :volume => {:count => 6, :price => 6}},
  :D => {:unit_price => 0.15}
})

terminal.test('ABCDABAA', 32.40)
terminal.test('CCCCCCC', 7.25)
terminal.test('ABCD', 15.40)

puts
