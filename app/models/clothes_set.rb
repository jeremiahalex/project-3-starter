class ClothesSet < ApplicationRecord
  belongs_to :size
  belongs_to :stock_status
  belongs_to :style
  has_many :loaned_item
  has_many :cart_item

  scope :in_stock_size_style, -> (size_id, style_id) do
    where stock_status_id: 1, size_id: size_id, style_id: style_id
  end

  def add_to_cart(user_id)
    @current_user = User.find(user_id)
    @current_user.cart_item.create(clothes_set_id: self.id)
  end

  def in_cart(user_id)
    @clothes_set = ClothesSet.find(self.id)
    @cart_item = @clothes_set.cart_item.where(user_id: user_id)
    @cart_item.any?
  end

  def cart_id (user_id)
    @clothes_set = ClothesSet.find(self.id)
    @cart_item = @clothes_set.cart_item.where(user_id: user_id)
    @cart_id = @cart_item[0].id
  end

  def change_status(stock_status_id)
    @clothes_set = ClothesSet.find(self.id)
    @clothes_set.update(stock_status_id: stock_status_id )
  end
end
