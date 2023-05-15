class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal_id, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token 


  validates :postal_id, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :building, presence: true, allow_blank: true
  validates :phone, presence: true, format: { with: /\A[0-9]{10,11}\z/, message: "should be 10 to 11 digits" }

  validates :user_id, presence: true
  validates :item_id, presence: true

  validates :token, presence: true

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postal_id: postal_id, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, history_id: history.id)
    
  end
end
