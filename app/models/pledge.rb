class Pledge < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :reward
  validates :dollar_amount, presence: true
  validates :dollar_amount, numericality: {greater_than: 0}

  def set_reward
    rewards = self.project.filter
    rewards.each do |reward|
      if self.dollar_amount >= reward.min_requirement
        self.reward = reward
      else
        return
      end
    end
  end



end
