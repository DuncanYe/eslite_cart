class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    normal: "normal",
    admin: "admin",
    superman: "superman"
  }

  def admin?
    role != "normal"
  end

end
