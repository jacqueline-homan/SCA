class Message < ActiveRecord::Base
  attr_accessible :approved, :bitlied, :length, :tweet_id, :tweet_text
  belongs_to :user # The name of the user.rb model 
end
