class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :users, through: :pledges
  #has_one :pledge
  #has_one :project, through: :pledge #you can only get a reward by pledging
end
