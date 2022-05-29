require 'pry'
class CashRegister

    attr_accessor :total, :discount, :last_transaction, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times do
            @items << title
        end
    end

    def apply_discount
        float_discount = 1.0 - self.discount/100.0
        float_total = self.total.to_f
        self.total = float_total * float_discount
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
    end

end

