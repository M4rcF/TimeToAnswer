class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions, counter_cache: true
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  after_create :set_cont

  private

  def set_cont
    AdminStatistic.set_statistic_admin("Question_cont")
  end
end
