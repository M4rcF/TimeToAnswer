class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank
  has_one :user_statistic

  after_create :set_cont

  private

  def set_cont
    AdminStatistic.set_statistic_admin("User_cont")
  end
end
