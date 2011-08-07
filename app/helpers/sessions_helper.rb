module SessionsHelper

  def get_email(auth_data)
    email = nil
    if auth['user_info']
      email = auth['user_info']['email'] if auth['user_info']['email'] # Google, Yahoo, GitHub
    elsif (auth['extra'] && auth['extra']['user_hash'])
      email = auth['extra']['user_hash']['email'] if auth['extra']['user_hash']['email'] # Facebook
    end
    email    
  end

end
