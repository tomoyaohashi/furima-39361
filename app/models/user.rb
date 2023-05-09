class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :surname, presence: true
         validates :name, presence: true
         validates :surnamekana, presence: true
         validates :namekana, presence: true
         validates :birthday, presence: true

         with_options presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々ー]/, message: '全角文字を使用してください' } do
          validates :surname
          validates :surname
        end

        with_options presence: true, format: { with: /[ァ-ヶ]/, message: '全角カナ文字を使用してください' } do
          validates :surnamekana
          validates :namekana
        end

        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates :password, format: { with: VALID_PASSWORD_REGEX }

end