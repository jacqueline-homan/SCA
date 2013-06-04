class User < ActiveRecord::Base
  attr_accessible :access_secret, :access_token, :name, :provider, :screen_name, :uid
  has_many :messages 
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]  # Twitter's user id (which is actually a number)
      user.screen_name = auth["info"]["nickname"]
      user.name = auth["info"]["name"] # 'info' is a top level key that includes 'name' inside of it.
      user.access_token = auth["credentials"]["token"] # 'token' is part of a scheme set up by Oauth that authenticates you, kind of like presenting yourself as "Jacqueline Homan"
      user.access_secret = auth["credentials"]["secret"] # 'secret' is part of a scheme set up by Oauth that authenticates you, kind of like showing your drivers license to prove that you're "Jacqueline Homan" 
      # binding.pry # Let's us use pry, stops the code in its tracks and lets you look around.
      logger.info("#{auth.uid} Creating User entry for UID ##{user.uid}")
      logger.info("#{auth.uid} access token #{user.access_token}")
      logger.info("#{auth.uid} access secret #{user.access_secret}")
      logger.info("#{auth.uid} screen name #{user.screen_name}")
      logger.info("#{auth.uid} name#{user.name}")
    end
  end
end

