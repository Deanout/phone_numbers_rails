class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_number, phone: { possible: true, allow_blank: true }

  def formatted_phone_number
    phone = Phonelib.parse(phone_number)
    formatted = phone.full_e164.presence || phone.full_national.presence 
  end

end
