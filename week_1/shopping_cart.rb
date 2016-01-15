class ShoppingCart
  def initialize
    @cart={}
    @prices={
      apple: 10,
      orange: 5,
      grapes: 15,
      banana: 20,
      watermelon: 50 
    }
  end
  def add_item_to_cart(item)
    if @cart[item]
      @cart[item] +=1
    else
      @cart[item] = 1
    end
  end
  def show 
    @cart.each do |name, amount|
      puts "#{amount} #{name}: #{@prices[name]*amount}"
    end
  end
end

my_cart = ShoppingCart.new

my_cart.add_item_to_cart :apple
# @cart => { apple: 1 }
my_cart.add_item_to_cart :banana
# @cart => { apple: 1, banana: 1 }
my_cart.add_item_to_cart :banana
# @cart => { apple: 1, banana: 2 }

my_cart.show

# 1 apple: 10$
# 2 bananas: 40$

# cart.cost = 50

# apples     10$
# oranges     5$
# grapes     15$
# banana     20$
# watermelon 50$