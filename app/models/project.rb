class Project < ActiveRecord::Base
  has_many :pledges
  has_many :pledging_users, through: :pledges, :source => :user
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user
  has_many :rewards
    accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: :true

  belongs_to :owner, :class_name => "User"

  validates :title, :funding_goal, :project_end_date, presence: true
  validates :title, uniqueness: true
  # validates :project_end_date, numericality: {greater_than: Time.now.to_i}
  # figure out a way to validate the project end date so it's greater than current time
  validates :funding_goal, numericality: {greater_than: 0}

  def funding_percent
     current_funding = 0.0
     self.pledges.each{|pledge| current_funding = pledge.dollar_amount}

     funding_percent = (current_funding / self.funding_goal * 100).round(2)
     "#{funding_percent}%"
   end

   def total_funding
     current_funding = 0.0

     self.pledges.each do |pledge|
       current_funding += pledges.dollar_amount if pledge.dollar_amount
     end
     current_funding
   end

   def filter
     return.self.rewards.select{|reward| reward.current_quantity > 0}.sort_by(&:min_requirement)
   end

end
