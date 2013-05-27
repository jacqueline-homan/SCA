class User < ActiveRecord::Base
  attr_accessible :access_secret, :access_token, :name, :provider, :screen_name, :uid
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      binding.pry # Let's us use pry, stops the code in its tracks and lets you look around.
    end
  end
end

