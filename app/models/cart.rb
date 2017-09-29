class Cart < ActiveRecord::Base
  has_one :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.inject(0.0) {|sum, li| sum += li.quantity * li.item.price}
  end

  def checkout
    self.line_items.each do |li|
      #binding.pry
      li.item.inventory -= li.quantity
      li.item.save
      #binding.pry
    end
    self.status = "Submitted"
    save
  end

  def add_item(item)
    li = self.line_items.find_by(item_id: item)
    if li = self.line_items.find_by(item_id: item)
      li.quantity += 1
    else
      li = self.line_items.build(item_id: item)
    end
    li
  end
end
