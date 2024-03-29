class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  has_many :permissions
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def self.reset_request_count!
    update_all("request_count = 0", "request_count > 0")
  end
  
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
