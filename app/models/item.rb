class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day

  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :charge_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :day_id, numericality: { other_than: 1, message: "を入力してください" }

  validates :product, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: { message: "を選択してください" }
end
