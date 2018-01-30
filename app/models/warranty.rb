class Warranty < ApplicationRecord
  belongs_to :customer, class_name: 'Account'
  belongs_to :product
  validates :product_id, uniqueness: true

  def list_products
    warranty_list = self.warranty.where(customer_id: current_user.id)
    product_list = []
    warranty_list.each do |e|
      product = {
        'name' => Product.find(e.product_id).name,
        'status' => Product.find(e.product_id).name,
        'end_date' => Product.find(e.product_id).name
      }
      product_list << product
    end
  end
end
