class CashRegister
  attr_accessor :total, :title, :price, :quantity
  attr_reader :discount, :items

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.title = title
    self.price = price
    self.quantity = quantity

    @items += ([title] * quantity)
    @total += (price * quantity)
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0

    self.total -=  (self.price * (self.discount / 100.0)).to_i
    "After the discount, the total comes to $#{self.total}."
  end

  def void_last_transaction
    @total -= self.price * self.quantity
    @items = @items.reject {|item| item == self.title}
    puts(items)
  end
end