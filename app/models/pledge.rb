class Pledge < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :reward
  validates :dollar_amount, presence: true
  validates :dollar_amount, numericality: {greater_than: 0}
end
