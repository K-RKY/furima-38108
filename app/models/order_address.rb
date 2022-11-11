class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:shipping_area_id,:municipalities,:house_number,:house_name,:phone_number,:token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :shipping_area_id, presence: true
  validates :municipalities, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities, house_number: house_number, house_name: house_name, phone_number: phone_number,order_id: order.id)
  end

end