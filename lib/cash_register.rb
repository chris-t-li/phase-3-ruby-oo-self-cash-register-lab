require "pry"

class CashRegister 
    attr_reader :discount, :items
    attr_accessor :total, :last_transaction

    def initialize(discount=0, total=0, items=[])
        @discount = discount
        @total = total
        @items = items
    end

    def add_item(title, price, qty=1)
        @last_transaction = [title, price, qty]
        @total += price*qty
        qty.times {@items << title}
    end

    def apply_discount
        if(@discount ==0) 
            return "There is no discount to apply."
        else 
            @total *= (1.0 - @discount / 100.0)
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @items.pop
        @total -= @last_transaction[1]*@last_transaction[2]
    end

end