class User < ActiveRecord::Base
  
  has_secure_password
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :gists, dependent: :destroy
  
  def email=(string)
    super(string.try(:downcase))
  end

end
