class Account
  include Mongoid::Document
  
  field :provider,  type: String
  field :uid,       type: String
#  field :name,      type: String
#  field :email,     type: String

  belongs_to :user

  def self.create_with_omniauth(auth)
    begin
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
#        if auth['user_info']
#          user.name = auth['user_info']['name'] if auth['user_info']['name'] # Twitter, Google, Yahoo, GitHub
#          user.email = auth['user_info']['email'] if auth['user_info']['email'] # Google, Yahoo, GitHub
#        end
#        if (auth['extra'] && auth['extra']['user_hash'])
#          user.name = auth['extra']['user_hash']['name'] if auth['extra']['user_hash']['name'] # Facebook
#          user.email = auth['extra']['user_hash']['email'] if auth['extra']['user_hash']['email'] # Facebook
#        end
      end
    rescue Exception => e
      raise e #Exception, "cannot create user record #{e.to_s}"
    end
  end

end
