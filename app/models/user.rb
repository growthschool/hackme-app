class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments

  def is_admin?
    self.role == "admin"
  end

  def display_name
    self.nickname.presence || self.email.split("@").first
  end

end
