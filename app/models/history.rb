class History < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :buy
  
end
