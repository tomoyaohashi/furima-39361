class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal_id, :prefecture_id, :city, :address, :building, :phone, :history_id, :user_id, :item_id

  validates :postal_id, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :building
  validates :phone, presence: true
  validates :history_id, presence: true

  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end