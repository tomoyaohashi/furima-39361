class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal_id, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  validates :postal_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にハイフンを入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: 'は10文字以上11以内で入力してください' }

  validates :postal_id, :prefecture_id, :token, :city, :address, :phone, :user_id, :item_id, presence: true

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postal_id: postal_id, prefecture_id: prefecture_id, city: city, address: address, building: building,
               phone: phone, history_id: history.id)
  end
end
