class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :first_name
      validates :last_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
      validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } 
    end
    
    validates :birth_date
  end
end
