class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :users, through: :pledges
  #has_one :pledge
  #has_one :project, through: :pledge #you can only get a reward by pledging

  validates :title, :min_requirement, presence: true
  validates :min_requirement, numericality: {greater_than: 0}

  def current_quantity
    return self.quantity - self.pledges.count
  end
end
